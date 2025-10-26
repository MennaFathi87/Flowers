import 'package:flowerss/views/Login_view.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/opacity_photo.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          opacityPhoto(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 150),
                const Center(
                  child: Text(
                    'WELCOME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Piedra',
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Text(
                    'TO FLOWORA!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Piedra',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'pizzola',
                      ),
                      children: [
                        TextSpan(text: 'Flowers for Every Moment!\n'),
                        TextSpan(
                          text: 'Birthdays',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pizzola'),
                        ),
                        TextSpan(text: ', '),
                        TextSpan(
                          text: 'weddings',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pizzola'),
                        ),
                        TextSpan(text: ', '),
                        TextSpan(
                          text: 'love',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pizzola'),
                        ),
                        TextSpan(text: ', '),
                        TextSpan(
                          text: 'gifts',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pizzola'),
                        ),
                        TextSpan(
                            text:
                                ', or simply to make any day special, because beauty is always worth sharing.',
                            style: TextStyle(
                              fontFamily: 'pizzola',
                            )),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Button(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  title: 'Get Started',
                  
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
