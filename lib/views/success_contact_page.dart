import 'package:flowerss/views/home_view.dart';
import 'package:flowerss/views/widgets/bottom_navigation.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flutter/material.dart';

class succesContact extends StatelessWidget {
  const succesContact({super.key});
  static String id = 'succes_cotact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/photo/photo2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Text(
                  'Contact us',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Piedra',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Get in touch!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/photo/Vector 4.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Thank You.",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffCF636C),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "We’ll be in touch as soon as possible!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffCF636C),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Button(
                          title: 'Back to Home',
                          onTap: () {
                            Navigator.pushNamed(context, HomePage.id);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
