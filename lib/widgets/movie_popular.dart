import 'package:flutter/material.dart';
import 'package:webtoonhw/screens/detail_screen.dart';

class PopMovie extends StatelessWidget {
  final String title, path, overview;
  final int id;
  final List<int> genre;
  final double height;
  final double width;
  final bool hasTitle;

  const PopMovie({
    super.key,
    required this.title,
    required this.path,
    required this.id,
    required this.overview,
    required this.genre,
    required this.height,
    required this.width,
    required this.hasTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              path: path,
              id: id,
              overview: overview,
              genre: genre,
            ),
          ),
        );
      },
      child: Container(
        width: width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
        ),
        child: Column(

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // 이미지를 둥글게 자르기 위해 추가
              child: Image.network(
                'https://image.tmdb.org/t/p/w500$path',
                headers: const {
                  'User-Agent':
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
                },
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            if (hasTitle) ...[
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                overflow : TextOverflow.visible,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
