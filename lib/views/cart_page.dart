import 'package:flowerss/model/product_model.dart';
import 'package:flowerss/views/checkout_page.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/custome_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flowerss/model/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static String id = "cart_page";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.cartItems;
    final total = CartManager.getTotalPrice();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          // زر الرجوع + العنوان
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                CustomBackButton(),
                Text(
                  "Cart",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffCF636C)),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          // قائمة المنتجات أو رسالة فاضية
          Expanded(
            child: cartItems.isEmpty
                ? const Center(
                    child: Text("Your cart is empty 😢",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        product: cartItems[index],
                        onRemove: () {
                          setState(() {}); // تحديث الصفحة بعد الحذف
                        },
                      );
                    },
                  ),
          ),
          // الجزء السفلي مع الفيكتور والمجموع
          SizedBox(
            height: 260,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/photo/Vector 4.png',
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _row("Subtotal", "\$${total.toStringAsFixed(2)}"),
                      _row("Delivery", "Free"),
                      const Divider(color: Colors.white, height: 25),
                      _row("Total", "\$${total.toStringAsFixed(2)}"),
                      const SizedBox(height: 20),
                      Button(
                        title: "Check out",
                        onTap: () {
                          Navigator.pushNamed(context, CheckoutPage.id);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _row(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left,
              style: const TextStyle(fontSize: 16, color: Color(0xffCF636C))),
          Text(right,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffCF636C))),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onRemove;

  const CartItemWidget({super.key, required this.product, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // صورة
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // اسم + سعر
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffCF636C),
                ),
              ),
              Text(
                "\$${product.price}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          // زر حذف
          IconButton(
            icon: const Icon(Icons.delete, color: Color(0xffCF636C)),
            onPressed: () {
              CartManager.removeFromCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Removed 🗑️")),
              );
              if (onRemove != null) onRemove!(); // تحديث الكارت
            },
          ),
        ],
      ),
    );
  }
}
