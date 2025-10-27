import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerss/views/profile_page.dart';
import 'package:flowerss/views/widgets/custome_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flowerss/views/widgets/bottom_navigation.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/costume_text_filed.dart';
import 'package:flowerss/views/widgets/opacity_photo.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static String id = 'editprofile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController name = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  /// 🧠 تحميل البيانات الحالية من Firestore
  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
      'name': name.text,
      'username': userName.text,
      'gender': gender.text,
      'phone': phoneNumber.text,
      'email': email.text,
    }, SetOptions(merge: true));
  }

  /// 💾 تحديث البيانات في Firestore
  Future<void> _saveProfileToFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': name.text,
        'username': userName.text,
        'gender': gender.text,
        'phone': phoneNumber.text,
        'email': email.text,
      }, SetOptions(merge: true));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully ✅')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: Stack(
        children: [
          opacityPhoto(),
          SingleChildScrollView(
            child: Column(
              children: [
                CustomBackButton(),
                const SizedBox(height: 80),
                const Text(
                  'Edit Profile',
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
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          CostumeFormTextFiled(
                              hintText: 'Name', controller: name),
                          const SizedBox(height: 20),
                          CostumeFormTextFiled(
                              hintText: 'UserName', controller: userName),
                          const SizedBox(height: 20),
                          CostumeFormTextFiled(
                              hintText: 'Gender', controller: gender),
                          const SizedBox(height: 20),
                          CostumeFormTextFiled(
                              hintText: 'PhoneNumber', controller: phoneNumber),
                          const SizedBox(height: 20),
                          CostumeFormTextFiled(
                              hintText: 'Email', controller: email),
                          const SizedBox(height: 20),
                          Button(
                            title: 'Save',
                            onTap: _saveProfileToFirebase,
                          )
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
