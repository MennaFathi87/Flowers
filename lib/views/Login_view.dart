import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerss/helper/snack_bar.dart';
import 'package:flowerss/views/home_view.dart';
import 'package:flowerss/views/register_page.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/costume_text_filed.dart';
import 'package:flowerss/views/widgets/divider.dart';
import 'package:flowerss/views/widgets/icons_socail.dart';
import 'package:flowerss/views/widgets/navigate_login.dart';
import 'package:flowerss/views/widgets/opacity_photo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  //* used to used to id to routing
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//* we use controller to select filed
final emailController = TextEditingController();
final passController = TextEditingController();
//* to
bool isLoading = false;

class _LoginPageState extends State<LoginPage> {
  @override
  //? disose for conrtoller
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  //! we use this var
  String? email, pass;
  //! we use globlal key to form validate
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //* background photo
          Positioned.fill(
            child: opacityPhoto(),
          ),

          //* body contain
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'HELLO AGAIN \n TO FLOWORA!',
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
                      fontFamily: 'pizzola',
                    ),
                  ),

                  const SizedBox(height: 40),
                  //? form
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
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffCF636C),
                                fontFamily: 'pizzola',
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: CostumeFormTextFiled(
                                  hintText: 'Email',
                                  controller: emailController,
                                  onChanged: (val) {
                                    email = val;
                                  },
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                )),
                            const SizedBox(height: 15),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: CostumeFormTextFiled(
                                  hintText: 'Password',
                                  controller: passController,
                                  onChanged: (val) {
                                    pass = val;
                                  },
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                )),
                            const SizedBox(height: 25),
                            Button(
                              title: isLoading ? 'Loading...' : 'Login',
                              onTap: () async {
                                //! validate the form firbase auth
                                if (formKey.currentState!.validate()) {
                                  setState(() => isLoading = true);

                                  try {
                                    //!firbase auth
                                    await signInUser();
                                    Navigator.pushNamed(
                                      context,
                                      HomePage.id,
                                      arguments: email,
                                    );
                                    //! states of ex
                                  } on FirebaseAuthException catch (ex) {
                                    if (ex.code == 'user-not-found') {
                                      snackbar(context,
                                          'No user found for that email.');
                                    } else if (ex.code == 'wrong-password') {
                                      snackbar(context,
                                          'Wrong password provided for that user.');
                                    }
                                  } catch (ex) {
                                    print(ex);
                                    snackbar(context, 'An error occurred');
                                  }

                                  setState(() => isLoading = false);
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    //* divider
                                    DividerLR(),
                                    //*
                                    Text(
                                      " Or Login With ",
                                      style: TextStyle(
                                        color: Color(0xffEEA3B1),
                                        fontSize: 10,
                                      ),
                                    ),
                                    //* divider
                                    DividerLR(),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                //! icons socail
                                iconsSocail(),
                              ],
                            ),
                            const SizedBox(height: 20),
                            NavigateLogin(
                              txt: 'Register',
                              onTap: () {
                                Navigator.pushNamed(context, RegisterPage.id);
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

  Future<void> signInUser() async {
    if (email == null || pass == null) return;
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: pass!,
    );
  }
}
