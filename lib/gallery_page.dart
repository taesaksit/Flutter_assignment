import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<Map<String, String>> images = [
    {
      'url':
          'https://cdn.pixabay.com/photo/2022/10/23/13/43/canoe-7541311_1280.jpg',
      'name': 'Canoe'
    },
    {
      'url':
          'https://cdn.pixabay.com/photo/2022/04/26/01/09/tibet-7157189_640.jpg',
      'name': 'Mountains'
    },
    {
      'url':
          'https://cdn.pixabay.com/photo/2021/11/27/12/16/mountain-6827881_640.jpg',
      'name': 'Forest'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Image.network(
                  images[index]['url']!,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                images[index]['name']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
