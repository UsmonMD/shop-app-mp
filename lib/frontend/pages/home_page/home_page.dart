import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/frontend/pages/account_tab_screen/account_tab_screen.dart';
import 'package:shop_app/frontend/pages/main_tab_screen/main_tab_screen.dart';
import 'package:shop_app/frontend/pages/products_list_page/products_list_page.dart';
import 'package:shop_app/frontend/pages/search_tab_screen/search_tab_screen.dart';
import 'package:shop_app/frontend/pages/shopping_card_tab_screen/shopping_card_tab_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<Widget> screens = [
    const MainTabScreen(),
    const SearchTabScreen(),
    const ShoppingCardTabScreen(),
    const AccountTabScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: const Color(0xFF3364E0),
          inactiveColor: const Color(0xFFA5A9B2),
          height: 75,
          border: const Border(
            top: BorderSide(
              color: Color(0xFFE8E9EC),
            ),
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Поиск',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Аккаунт',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            routes: {
              '/': (context) => const MainTabScreen(),
              '/products_list_page': (context) => const ProductListPage(),
            },
            builder: (context) => screens[index],
          );
        },
      ),
    );
  }
}
