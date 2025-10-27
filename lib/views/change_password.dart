import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerss/helper/snack_bar.dart';
import 'package:flowerss/views/widgets/bottom_navigation.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/costume_text_filed.dart';
import 'package:flowerss/views/widgets/custome_back_button.dart';
import 'package:flowerss/views/widgets/opacity_photo.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmNewPassword = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future<void> _changePassword() async {
    if (newPassword.text.trim() != confirmNewPassword.text.trim()) {
      snackbar((context), ('Passwords do not match ❌'));

      return;
    }

    setState(() => isLoading = true);

    try {
      final user = _auth.currentUser;

      if (user != null) {
        await user.updatePassword(newPassword.text.trim());
        snackbar((context), ('Password updated successfully '));
      } else {
        snackbar((context), 'No user logged in ');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        snackbar((context), 'Please log in again to change your password ');
      } else {
        snackbar((context), 'error');
      }
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: Stack(
        children: [
          opacityPhoto(),
          SingleChildScrollView(
            child: Column(
              children: [
                CustomBackButton(),
                const SizedBox(height: 80),
                const Text(
                  'Change Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Piedra',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 80),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/photo/Vector 4.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Column(
                      
                        children: [
                          const Text(
                            '“Keep your account safe with a new \n password.”',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffCF636C), fontSize: 20),
                          ),
                          const SizedBox(height: 20),
                          CostumeFormTextFiled(
                            hintText: 'New Password',
                            controller: newPassword,
                          ),
                          const SizedBox(height: 20),
                          CostumeFormTextFiled(
                            hintText: 'Confirm Password',
                            controller: confirmNewPassword,
                          ),
                          const SizedBox(height: 20),
                          Button(
                            title: isLoading ? 'Saving...' : 'Save',
                            onTap: isLoading ? null : _changePassword,
                          ),
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
