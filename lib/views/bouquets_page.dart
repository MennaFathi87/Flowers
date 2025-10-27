import 'package:flowerss/model/product_model.dart';
import 'package:flowerss/views/product_card_details.dart';
import 'package:flutter/material.dart';

class BouquetsPage extends StatelessWidget {
  BouquetsPage({super.key});

  final List<ProductModel> products = [
    ProductModel(
      title: 'Red rose bouquet',
      description:
          'about:\nThe tulip is a delicate, elegant flower with a smooth stem and soft petals. Its colors symbolize love, hope, and beauty',
      include: 'Red Flower, baby breath',
      image: 'assets/photo/photo10.jpg',
      price: 150.0,
    ),
    ProductModel(
      title: 'Sunflower bouquet',
      description:
          'about:\nThe tulip is a delicate, elegant flower with a smooth stem and soft petals. Its colors symbolize love, hope, and beauty',
      include: 'Sunflower bouquet, Pot',
      image: 'assets/photo/photo15.jpg',
      price: 220.0,
    ),
    ProductModel(
      title: 'Red and Pink rose bouquet',
      description:
          'about:\nThe tulip is a delicate, elegant flower with a smooth stem and soft petals. Its colors symbolize love, hope, and beauty.',
      include: 'Red and Pink rose bouquet, Small Pot',
      image: 'assets/photo/photo4.jpg',
      price: 180.0,
    ),
    ProductModel(
      title: 'White and Pink rose bouquet',
      description:
          'about:\nThe tulip is a delicate, elegant flower with a smooth stem and soft petals. Its colors symbolize love, hope, and beauty',
      include: 'White and Pink rose bouquet, Decorative Pot',
      image: 'assets/photo/photo5.jpg',
      price: 300.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عمودين
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(productModel: item),
                  ),
                );
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      item.image,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xffCF636C).withOpacity(.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
