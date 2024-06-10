// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/components/bottom_nav_bar.dart';
import 'package:ecommerce_app/login/welcome_screen.dart';
import 'package:ecommerce_app/pages/about_page.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize _pages here
    final List<Widget> _pages = [
      const ShopPage(),
      // Pass null or handle appropriately if no default sweatshirt is provided
      CartPage(sweatshirt: null),
    ];

    return Scaffold(
      backgroundColor: Color(0xff0d3b66),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff0d3b66),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'lib/images/logo.png',
                    color: Color(0xfffaf0ca),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Color(0xfffaf0ca),
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Color(0xfffaf0ca)),
                    ),
                    onTap: () {
                      // Navigate to the corresponding page
                      setState(() {
                        _selectedIndex = 0;
                      });
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Color(0xfffaf0ca),
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(color: Color(0xfffaf0ca)),
                    ),
                    onTap: () {
                      // Navigate to the About page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color(0xfffaf0ca),
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Color(0xfffaf0ca)),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
