import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/main/categories/categories_page.dart';
import 'package:flutter_app/main/favorites/favorites_page.dart';
import 'package:flutter_app/main/orders/orderdetail_page.dart';
import 'package:flutter_app/main/storemain_page.dart';
import 'package:flutter_app/setting/setting_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex = 0;
  final controller = PageController(initialPage: 0);

  onTapped(int index) {
    setState(() {
      currentTabIndex  = index;
      controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: double.infinity,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              StoreMainPage(controller),
              CategoriesPage(controller),
              OrderDetailPage(),
              FavoritesPage(),
              SettingPage()
            ],
            onPageChanged: (index){
              setState(() {
                currentTabIndex  = index;
              });
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentTabIndex,
              elevation: 4,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: onTapped,
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-home.svg',
                    color: HexColor(colorYellowGold),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/icon-home.svg',
                    color: Colors.black,
                  ),
                  label: 'Stroe',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-categories.svg',
                    color: HexColor(colorYellowGold),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/icon-categories.svg',
                    color: Colors.black,
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-shopping-bag.svg',
                    color: HexColor(colorYellowGold),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/icon-shopping-bag.svg',
                    color: Colors.black,
                  ),
                  label: 'Shopping',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-bookmark.svg',
                    color: HexColor(colorYellowGold),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/icon-bookmark.svg',
                    color: Colors.black,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-settings.svg',
                    color: HexColor(colorYellowGold),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/icon-settings.svg',
                    color: Colors.black,
                  ),
                  label: 'Setting',
                ),
              ],
            ),
      ),
        );
  }
}
