// register_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerss/views/verified_page.dart';
import 'package:flutter/material.dart';
import 'package:flowerss/helper/snack_bar.dart';
import 'package:flowerss/views/Login_view.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/costume_text_filed.dart';
import 'package:flowerss/views/widgets/divider.dart';
import 'package:flowerss/views/widgets/icons_socail.dart';
import 'package:flowerss/views/widgets/navigate_login.dart';
import 'package:flowerss/views/widgets/opacity_photo.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: opacityPhoto()),
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    'CREATE YOUR',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Piedra',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'ACCOUNT AT FLOWORA!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Piedra',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '“A touch of nature, a gift from the \n heart.”',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'pizzola'
                    ),
                  ),
                  const SizedBox(height: 40),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/photo/Vector 4.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Column(
                          children: [
                            const Text(
                              "REGISTER",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffCF636C),
                                fontFamily: 'pizzola'
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Full Name
                            CostumeFormTextFiled(
                              hintText: 'Full Name',
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),

                            // Email
                            CostumeFormTextFiled(
                              hintText: 'Email',
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!value.contains('@')) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),

                            // Password
                            CostumeFormTextFiled(
                              hintText: 'Password',
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),

                            // Register button
                            Button(
                              title: isLoading ? 'Loading...' : 'Register',
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  setState(() => isLoading = true);

                                  try {
                                    await signUpWithEmail();

                                    snackbar(
                                        context, 'Verification email sent');
                                    Navigator.pushNamed(
                                        context, VerifiedPage.id);
                                  } on FirebaseAuthException catch (ex) {
                                    if (ex.code == 'weak-password') {
                                      snackbar(context,
                                          'The password provided is too weak.');
                                    } else if (ex.code ==
                                        'email-already-in-use') {
                                      snackbar(context,
                                          'The account already exists for that email.');
                                    } else {
                                      snackbar(context,
                                          ex.message ?? 'An unknown error.');
                                    }
                                  } catch (ex) {
                                    snackbar(context, 'Error: $ex');
                                  }

                                  setState(() => isLoading = false);
                                }
                              },
                            ),

                            const SizedBox(height: 20),

                            // Divider
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    DividerLR(),
                                    Text(
                                      " Or Login With ",
                                      style: TextStyle(
                                        color: Color(0xffEEA3B1),
                                        fontSize: 10,
                                      ),
                                    ),
                                    DividerLR()
                                  ],
                                ),
                                const SizedBox(height: 20),
                                iconsSocail(),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Navigate to login
                            NavigateLogin(
                              txt: 'Login',
                              onTap: () {
                                Navigator.pushNamed(context, LoginPage.id);
                              },
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signUpWithEmail() async {
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();
    final name = nameController.text.trim();

    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass);

    // تحديث الاسم في Firebase Profile
    await userCredential.user!.updateDisplayName(name);

    // إرسال بريد التحقق
    await userCredential.user!.sendEmailVerification();

    // لمراقبة، اطبعي تأكيد في الـ console
    // ignore: avoid_print
    print('✅ Verification email sent to $email');
  }
}
