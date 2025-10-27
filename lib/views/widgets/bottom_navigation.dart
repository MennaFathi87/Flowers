import 'package:flowerss/views/contact_us1_page.dart';

import 'package:flowerss/views/favourit_page.dart';
import 'package:flowerss/views/home_view.dart';
import 'package:flowerss/views/profile_page.dart';

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  //!
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      width: 430,
      decoration: BoxDecoration(
        color: const Color(0xffFFD3DC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(84),
          topRight: Radius.circular(84),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 8,
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xffFFD3DC),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xffCF636C),
          unselectedItemColor: const Color(0xffCF636C),
          elevation: 0,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  Navigator.pushNamed(context, FavoritesPage.id);
                },
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ContactUs1Page.id);
                },
                icon: Icon(Icons.phone),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfilePage.id);
                },
                icon: Icon(Icons.person),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
