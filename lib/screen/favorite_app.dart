import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const FavoriteApp());
}

class FavoriteApp extends StatelessWidget {
  const FavoriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FavoritePage(),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 테스트용 이미지 주소들
    final List<Map<String, String>> wishItems = [
      {
        'title': '파주 테라피크닉',
        'location': '파주시 프로방스마을',
        'imageUrl': 'https://picsum.photos/id/10/200/300'
      },
      {
        'title': '강릉 블리스펜션',
        'location': '강릉 바다 바로 앞',
        'imageUrl': 'https://picsum.photos/id/11/200/300'
      },
      {
        'title': '라마다 속초 호텔',
        'location': '대포항',
        'imageUrl': 'https://picsum.photos/id/12/200/300'
      },
      {
        'title': '반얀트리 클럽 앤 스파',
        'location': '버티고개 1번출구',
        'imageUrl': 'https://picsum.photos/id/13/200/300'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              context.go('/');  // 추후 마이페이지 경로로 변경
            },
          ),
        ),
      body: ListView.separated(
        itemCount: wishItems.length,
        separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFC1C1C1)),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. 이미지 (둥근 모서리 적용)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    wishItems[index]['imageUrl']!,
                    width: 100,
                    height: 140,
                    fit: BoxFit.cover,
                    // 로딩 중 표시할 위젯
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 100,
                        height: 140,
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 15),
                // 2. 텍스트 정보
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        wishItems[index]['title']!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        wishItems[index]['location']!,
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                // 3. 하트 아이콘
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}