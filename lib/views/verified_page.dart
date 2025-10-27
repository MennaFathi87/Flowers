import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerss/views/home_view.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/opacity_photo.dart';
import 'package:flutter/material.dart';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({super.key});
  static String id = 'verify_page';

  @override
  State<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  //!auth
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  //! state of message
  String? statusMessage;
  //! to check email
  Future<void> checkVerification() async {
    setState(() {
      loading = true;
      statusMessage = null;
    });

    await auth.currentUser?.reload();
    final user = auth.currentUser;

    if (user != null && user.emailVerified) {
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else {
      setState(() {
        statusMessage = 'Please verify your email first.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please verify your email first.')),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: opacityPhoto()),

          // المحتوى
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Text(
                  'WELCOME \n TO FLOWORA!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Piedra',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '“A touch of nature, a gift from the heart.”',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'pizzola'),
                ),
                const SizedBox(height: 40),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/photo/Vector 4.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Verify Your Email',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffCF636C),
                                fontFamily: 'pizzola'),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'We have sent a verification link to your email.\nPlease check your inbox (and spam folder) before proceeding.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffCF636C)),
                          ),
                          const SizedBox(height: 25),

                          // message
                          if (statusMessage != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                statusMessage!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                          SizedBox(
                            height: 30,
                          ),

                          Button(
                            title: loading ? 'Checking...' : 'Verified ',
                            onTap: checkVerification,
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
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
