import 'package:flowerss/model/product_model.dart';
import 'package:flowerss/views/product_card_details.dart';
import 'package:flutter/material.dart';

class PlantsPage extends StatelessWidget {
  PlantsPage({super.key});

  final List<ProductModel> products = [
    ProductModel(
      title: 'indoor Green',
      description:
          'A lovely plant perfect for indoor decoration. It adds freshness and elegance.',
      include: 'Pink Flowers, Leaves',
      image: 'assets/photo/photo7.jpg',
      price: 150.0,
    ),
    ProductModel(
      title: 'Green Home Plant',
      description:
          'This plant improves air quality and gives a calming nature vibe.',
      include: 'Green Leaves, Pot',
      image: 'assets/photo/Photo12.jpg',
      price: 220.0,
    ),
    ProductModel(
      title: 'Mini Tree Decor',
      description: 'A small decorative tree that brings life to any space.',
      include: 'Tree Branches, Small Pot',
      image: 'assets/photo/Photo13.jpg',
      price: 180.0,
    ),
    ProductModel(
      title: 'Golden Plant Leaf',
      description:
          'Unique plant with golden touches. A luxury decoration piece.',
      include: 'Golden Leaves, Decorative Pot',
      image: 'assets/photo/Photo38.jpg',
      price: 300.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, idx) {
        final item = products[idx];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(productModel: item),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
