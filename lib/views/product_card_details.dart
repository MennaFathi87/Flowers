import 'package:flowerss/model/cart.dart';
import 'package:flowerss/model/favourite.dart';
import 'package:flowerss/model/product_model.dart';
import 'package:flowerss/views/widgets/cusome_fave_button.dart';
import 'package:flowerss/views/widgets/custome_back_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailsPage({super.key, required this.productModel});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.productModel.price;
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
      totalPrice = widget.productModel.price * quantity;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        totalPrice = widget.productModel.price * quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // الفيكتور في الخلفية
            Image.asset(
              'assets/photo/Vector 4.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // كل العناصر فوق الفيكتور
            Column(
              children: [
                // صورة المنتج
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        widget.productModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomBackButton(),
                            CustomFaveButton(
                              ontap: () {
                                FavoriteManager.addFavorite(
                                    widget.productModel);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Added to favorites 💖'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.productModel.title,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffCF636C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "about:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffCF636C),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.productModel.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xffCF636C),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffCF636C),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffFFD3DC),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove,
                                      color: Color(0xffCF636C)),
                                  onPressed: decreaseQuantity,
                                ),
                                Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffCF636C),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add,
                                      color: Color(0xffCF636C)),
                                  onPressed: increaseQuantity,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${widget.productModel.title} added to cart  (x$quantity)'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xffCF636C),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: InkWell(
                            onTap: () {
                              CartManager.addToCart(widget.productModel);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${widget.productModel.title} added to cart 🛒'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add to Cart ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.shopping_cart_outlined,
                                      color: Colors.white, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
