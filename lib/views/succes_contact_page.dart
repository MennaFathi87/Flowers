import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowerss/views/success_contact_page.dart';
import 'package:flowerss/views/widgets/bottom_navigation.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/costume_text_filed.dart';
import 'package:flowerss/views/widgets/opacity_photo.dart';
import 'package:flutter/material.dart';

class ContactUs1Page extends StatefulWidget {
  const ContactUs1Page({super.key});
  static String id = 'contactPage';

  @override
  State<ContactUs1Page> createState() => _ContactUs1PageState();
}

final emailController = TextEditingController();
final passController = TextEditingController();
final messageController = TextEditingController();

class _ContactUs1PageState extends State<ContactUs1Page> {
  Future<void> sendMessage() async {
    // التحقق إن كل الحقول مش فاضية
    if (emailController.text.isEmpty ||
        passController.text.isEmpty ||
        messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    // إظهار مؤشر التحميل
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // تخزين فقط الإيميل والرسالة في Firestore
      await FirebaseFirestore.instance.collection('contactMessages').add({
        'email': emailController.text,
        'message': messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // غلق مؤشر التحميل
      Navigator.pop(context);

      // تنظيف الحقول بعد الإرسال
      emailController.clear();
      passController.clear();
      messageController.clear();

      // ✅ الانتقال لصفحة الـ Success بعد النجاح
      Navigator.pushReplacementNamed(context, succesContact.id);
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: Stack(
        children: [
          Positioned.fill(child: opacityPhoto()),
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
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
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CostumeFormTextFiled(
                              hintText: 'Email',
                              controller: emailController,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CostumeFormTextFiled(
                              hintText: 'Password',
                              controller: passController,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CostumeFormTextFiled(
                              hintText: 'Enter your message',
                              maxlines: 10,
                              controller: messageController,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Button(
                            title: 'Send',
                            onTap: sendMessage,
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
