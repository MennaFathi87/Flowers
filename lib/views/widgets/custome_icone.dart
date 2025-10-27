import 'package:flowerss/views/cart_page.dart';
import 'package:flutter/material.dart';

class CustomeIcon extends StatelessWidget {
  const CustomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xffCF636C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return CartPage();
          }));
        },
        icon: Icon(Icons.shopping_cart),
        iconSize: 36,
        color: Color(0xffFFD3DC),
      ),
    );
  }
}
