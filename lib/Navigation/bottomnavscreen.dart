import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task/Navigation/cartscreen.dart';
import 'package:task/Navigation/categoriesscreen.dart';
import 'package:task/Navigation/homescreen.dart';
import 'package:task/Navigation/profilescreen.dart';
import 'package:task/Themes/colorpickerscreen.dart';

class Bottomnavigationscreen extends StatefulWidget {
  const Bottomnavigationscreen({super.key});

  @override
  _BottomnavigationscreenState createState() => _BottomnavigationscreenState();
}

class _BottomnavigationscreenState extends State<Bottomnavigationscreen> {
  int _selectedIndex = 0;
  DateTime? _lastPressedAt;
  final List<int> _navigationStack = [];

  final List<Widget> _widgetOptions = [
    HomescreenPage(),
    Categoriesscreenpage(),
    Cartscreenpage(),
    Profilescreen(),
  ];

  Future<bool> _onWillPop() async {
    if (_navigationStack.isNotEmpty) {
      setState(() {
        _selectedIndex = _navigationStack.removeLast();
      });
      return Future.value(false);
    } else {
      final now = DateTime.now();
      if (_lastPressedAt == null || now.difference(_lastPressedAt!) > Duration(seconds: 2)) {
        _lastPressedAt = now;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Press back again to exit'),
            duration: Duration(seconds: 2),
          ),
        );
        return Future.value(false);
      }
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.red,
        unSelectedColor: Colors.black,
        backgroundColor: Textcolor, 
        currentIndex: _selectedIndex,
        unselectedIconSize: 25,
        selectedIconSize: 25,
        onTap: (index) {
          setState(() {
            if (_selectedIndex != index) {
              _navigationStack.add(_selectedIndex);
            }
            _selectedIndex = index;
          });
        },
        enableLineIndicator: false,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: Icons.home,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Categories',
            icon: Icons.list,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Cart',
            icon: Icons.card_travel,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Profile',
            icon: Icons.person,
            isAssetsImage: false,
          ),
        ],
      ),
    );
  }
}
