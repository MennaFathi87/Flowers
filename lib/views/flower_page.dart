import 'package:flowerss/model/flower_modl.dart';
import 'package:flutter/material.dart';

class FlowersPage extends StatelessWidget {
  FlowersPage({super.key});

  final List<FlowerModl> flowers = [
    FlowerModl(image: 'assets/photo/Rectangle 17.png', txt: 'Pink Rose'),
    FlowerModl(image: 'assets/photo/photo9.jpg', txt: 'Daisy'),
    FlowerModl(image: 'assets/photo/photo16.jpg', txt: 'Red Rose'),
    FlowerModl(image: 'assets/photo/photo14.jpg', txt: 'Tulip'),
    FlowerModl(image: 'assets/photo/photo11.jpg', txt: 'Chrysanthemum'),
    FlowerModl(image: 'assets/photo/photo14.jpg', txt: 'Tulip'),
    FlowerModl(image: 'assets/photo/photo8.jpg', txt: 'Baby breath'),
    FlowerModl(image: 'assets/photo/photo10.jpg', txt: 'Red Rose Boqutes'),
    FlowerModl(image: 'assets/photo/photo4.jpg', txt: 'Rose Boqutes'),
    FlowerModl(image: 'assets/photo/photo5.jpg', txt: 'white and pink'),
  ];

  @override
  Widget build(BuildContext context) {
    final List<FlowerModl> bestSeller = flowers.take(4).toList();
    final List<FlowerModl> popular = flowers.skip(4).take(6).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Best Seller ',
            style: TextStyle(
              color: Color(0xffCF636C),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: bestSeller.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = bestSeller[index];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        item.image,
                        height: 190,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.txt,
                      style: const TextStyle(
                        color: Color(0xffCF636C),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Popular ',
            style: TextStyle(
              color: Color(0xffCF636C),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12, // المسافة بين الأعمدة
            runSpacing: 12, // المسافة بين الصفوف
            children: popular.map((item) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 16 * 2 - 12 * 2) /
                    3, // عرض كل عنصر 1/3 من الشاشة مع المسافات
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        item.image,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.txt,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xffCF636C),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
