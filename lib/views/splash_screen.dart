import 'package:flowerss/views/home_view.dart';
import 'package:flutter/material.dart';
import 'dart:async'; //Timer

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/photo/photo2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Text(
                ' FLOWORA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Piedra',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
