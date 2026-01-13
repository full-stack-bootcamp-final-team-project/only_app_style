import 'package:flutter/material.dart';

class AccommodationSearchPage extends StatefulWidget {
  const AccommodationSearchPage({super.key});

  @override
  State<AccommodationSearchPage> createState() => _AccommodationSearchPageState();
}

class _AccommodationSearchPageState extends State<AccommodationSearchPage> {
  DateTimeRange? _selectedDateRange;

  DateTimeRange _initialDateRange() {
    final now = DateTime.now();
    return DateTimeRange(start: now, end: now.add(const Duration(days: 1)));
  }

  Future<void> _showCustomCalendar() async {
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomCalendar(
          initialRange: _selectedDateRange ?? _initialDateRange(),
          onRangeSelected: (range) {
            setState(() => _selectedDateRange = range);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  String _formatDateRange() {
    if (_selectedDateRange == null) return '날짜 선택';
    final s = _selectedDateRange!.start;
    final e = _selectedDateRange!.end;
    return '${s.year}년 ${s.month}월 ${s.day}일 (${_getWeekday(s.weekday)}) - '
        '${e.year}년 ${e.month}월 ${e.day}일 (${_getWeekday(e.weekday)})';
  }

  String _getWeekday(int weekday) {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    return days[weekday - 1];
  }

  void _onSearchPressed() {
    final params = {
      'location': '숙소명, 지역',
      'checkIn': _selectedDateRange?.start.toIso8601String(),
      'checkOut': _selectedDateRange?.end.toIso8601String(),
      'guests': '2',
    };
    print('검색 조건: $params');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // 앱바 (기존 유지)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Text('←', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                  Expanded(
                    child: Center(
                      child: Text(
                        '숙소 검색',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF939393)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 5, offset: const Offset(3, 3)),
                    BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 5, offset: const Offset(-3, -3)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchField('숙소명, 지역', Icons.search, false),
                    const Divider(height: 30, thickness: 1, color: Color(0xFFC5C5C5)),
                    GestureDetector(
                      onTap: _showCustomCalendar,
                      child: _buildSearchField(_formatDateRange(), Icons.calendar_today, true),
                    ),
                    const Divider(height: 30, thickness: 1, color: Color(0xFFC5C5C5)),
                    _buildCounter(),
                    const SizedBox(height: 10),
                    _buildSubmitButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(String hint, IconData icon, bool clickable) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Colors.grey[700]),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            hint,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: hint.contains('숙소명') || hint == '날짜 선택'
                  ? const Color(0xFFA6A6A6)
                  : Colors.black87,
            ),
          ),
        ),
        if (clickable) const Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.grey),
      ],
    );
  }

  Widget _buildCounter() {
    return Row(
      children: [
        const Icon(Icons.person, size: 30),
        const SizedBox(width: 27),
        const Text('인원', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        const Spacer(),
        Row(
          children: const [
            Text('-', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
            SizedBox(width: 20),
            Text('2', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
            SizedBox(width: 20),
            Text('+', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
          ],
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: SizedBox(
            height: 47,
            child: ElevatedButton(
              onPressed: _onSearchPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9C95CA),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
              child: const Text(
                '검색',
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── 이번 달만 보이는 커스텀 달력 (이동 버튼 추가 + 재선택 로직 개선) ────────
class CustomCalendar extends StatefulWidget {
  final DateTimeRange initialRange;
  final ValueChanged<DateTimeRange?> onRangeSelected;

  const CustomCalendar({
    super.key,
    required this.initialRange,
    required this.onRangeSelected,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _currentMonth;
  DateTimeRange? _range;

  @override
  void initState() {
    super.initState();
    _currentMonth = widget.initialRange.start;
    _range = widget.initialRange;
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  bool _isInRange(DateTime day) {
    if (_range == null) return false;
    return !day.isBefore(_range!.start) && !day.isAfter(_range!.end);
  }

  bool _isStart(DateTime day) => _range != null && day.isAtSameMomentAs(_range!.start);
  bool _isEnd(DateTime day) => _range != null && day.isAtSameMomentAs(_range!.end);

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstWeekday = DateTime(_currentMonth.year, _currentMonth.month, 1).weekday;

    return Container(
      width: 338,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFF9B9B9B)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 헤더: 이전/다음 달 버튼 + 년월
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, color: Color(0xFF424242)),
                onPressed: _previousMonth,
              ),
              Text(
                '${_currentMonth.year}년 ${_currentMonth.month}월',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF424242)),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, color: Color(0xFF424242)),
                onPressed: _nextMonth,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 요일 헤더
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['일', '월', '화', '수', '목', '금', '토'].map((day) {
              final color = day == '일'
                  ? const Color(0xFFFF3B30)
                  : day == '토'
                  ? const Color(0xFF3D85B9)
                  : const Color(0xFF424242);
              return SizedBox(
                width: 44,
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w500),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 8),

          // 날짜 그리드
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemCount: 42,
            itemBuilder: (context, i) {
              final day = i - firstWeekday + 1;
              if (day < 1 || day > daysInMonth) return const SizedBox.shrink();

              final date = DateTime(_currentMonth.year, _currentMonth.month, day);
              final isWeekend = date.weekday == DateTime.sunday || date.weekday == DateTime.saturday;
              final color = isWeekend
                  ? (date.weekday == DateTime.sunday ? const Color(0xFFFF3B30) : const Color(0xFF3D85B9))
                  : const Color(0xFF333333);

              final inRange = _isInRange(date);
              final isStart = _isStart(date);
              final isEnd = _isEnd(date);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (_range == null) {
                      // 첫 클릭 → 시작일
                      _range = DateTimeRange(start: date, end: date);
                    } else if (date.isBefore(_range!.start)) {
                      // 시작일보다 이전 → 새 시작일로 초기화
                      _range = DateTimeRange(start: date, end: date);
                    } else {
                      // 시작일 이후 → 체크아웃 설정
                      _range = DateTimeRange(start: _range!.start, end: date);
                    }
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (inRange && !isStart && !isEnd)
                      Container(
                        width: 44,
                        height: 31,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFEEEEEE),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                        ),
                      ),
                    if (isStart || isEnd)
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const ShapeDecoration(color: Color(0xFF9C95CA), shape: OvalBorder()),
                      ),
                    Text(
                      '$day',
                      style: TextStyle(
                        color: isStart || isEnd ? Colors.white : color,
                        fontSize: 11.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => widget.onRangeSelected(_range),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9C95CA),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('확인', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}