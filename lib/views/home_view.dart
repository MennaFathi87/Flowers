import 'package:flowerss/views/alii_page.dart';
import 'package:flowerss/views/bouquets_page.dart';
import 'package:flowerss/views/flower_page.dart';
import 'package:flowerss/views/planet_page.dart';
import 'package:flutter/material.dart';
import 'package:flowerss/views/widgets/bottom_navigation.dart';
import 'package:flowerss/views/widgets/custome_appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<String> categories = ["All", "Flowers", "Bouquets", "Plants"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Costome_appbar( ),
          const SizedBox(height: 16),

          // text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Category',
              style: TextStyle(
                color: Color(0xffCF636C),
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // catagory
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CategoryBar(
              categories: categories,
              selectedIndex: selectedIndex,
              onTap: (index) => setState(() => selectedIndex = index),
            ),
          ),

          const SizedBox(height: 15),

          // body catagories
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                 AllPage(),
                FlowersPage(),
                 BouquetsPage(),
                PlantsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
class Costome_button extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback? onTap;

  const Costome_button({
    super.key,
    required this.text,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xffCF636C) : const Color(0xffFFD3DC),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffCF636C)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xffCF636C),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// 🔹 كاتيجوري بار ثابت (أزرار All, Flowers, Bouquets, Plants)
class CategoryBar extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onTap;

  const CategoryBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xffFFD3DC),
        borderRadius: BorderRadius.circular(84),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          categories.length,
          (index) => Costome_button(
            text: categories[index],
            selected: selectedIndex == index,
            onTap: () => onTap(index),
          ),
        ),
      ),
    );
  }
}



