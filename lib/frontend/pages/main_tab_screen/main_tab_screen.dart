import 'package:flutter/material.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: const Icon(
          Icons.location_on_outlined,
          color: Colors.black,
          size: 30,
        ),
        title: const ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            'Санкт-Петербург',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            '12 Августа, 2023',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(radius: 22),
          ),
        ],
      ),
      body: const MainTabBody(),
    );
  }
}

class MainTabBody extends StatelessWidget {
  const MainTabBody({super.key});

  static List<String> productNames = [
    'Все товары',
    'Женские товары',
    'Компьютерные товары',
    'Мужские товары'
  ];
  static List<Color> cardColors = [
    const Color(0xFFFFF2D2),
    const Color(0xFFFFEBE0),
    const Color(0xFFD8F5F3),
    const Color(0xFFEFF5CF),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/products_list_page',
              arguments: productNames[i],
            );
          },
          child: Card(
            color: cardColors[i],
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 16,
                bottom: 85,
              ),
              child: Text(
                productNames[i],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (__, _) => const SizedBox(height: 10),
      itemCount: productNames.length,
    );
  }
}
