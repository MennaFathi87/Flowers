import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flowerss/views/widgets/opacity_photo.dart';
import 'package:flowerss/views/login_view.dart'; // غيّري المسار لو صفحة اللوجين في مكان تاني

class LogOutPage extends StatelessWidget {
  const LogOutPage({super.key});
  static String id = 'logout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: opacityPhoto()),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/photo/Rectangle 40.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error,
                        color: Color(0xffCF636C),
                        size: 60,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '“Are you sure you want to \n log out?”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'pizzola'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.pop(context); // يقفل الديلوج

                              // 👇 كود تسجيل الخروج من Firebase
                              await FirebaseAuth.instance.signOut();

                              // 👇 يرجع المستخدم لصفحة تسجيل الدخول
                              Navigator.pushReplacementNamed(
                                  context, LoginPage.id);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffCF636C),
                            ),
                            child: const Text("Yes",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 25),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // يرجع للصفحة اللي قبل
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffCF636C),
                              ),
                              child: const Text(
                                "No",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
