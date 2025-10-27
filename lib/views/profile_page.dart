import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerss/views/edit_profile.dart';
import 'package:flowerss/views/widgets/custome_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flowerss/views/change_password.dart';
import 'package:flowerss/views/log_out_page.dart';
import 'package:flowerss/views/widgets/bottom_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = "profile_page";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final name = user?.displayName ?? 'No name';
    final photoUrl = user?.photoURL;

    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 40),
          const CustomBackButton(),

          // الصورة الشخصية
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: photoUrl != null
                    ? NetworkImage(photoUrl)
                    : const AssetImage('assets/photo/photo16.jpg')
                        as ImageProvider,
                backgroundColor: Colors.grey[200],
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffCF636C),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffFFD3DC), width: 2),
                ),
                padding: const EdgeInsets.all(6),
                child:
                    const Icon(Icons.edit, size: 18, color: Color(0xffFFD3DC)),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // الاسم
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              color: Color(0xffCF636C),
              fontWeight: FontWeight.bold,
              fontFamily: 'pizzola',
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/photo/Vector 4.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomProfileOption(
                          icon: Icons.person,
                          title: 'Edit Profile',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditProfile()),
                            );
                          },
                        ),
                        CustomProfileOption(
                          icon: Icons.lock,
                          title: 'Change Password',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChangePassword()),
                            );
                          },
                        ),
                        CustomProfileOption(
                          icon: Icons.logout,
                          title: 'Log out',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogOutPage()),
                            );
                          },
                        ),
                      ],
                    ),
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

class CustomProfileOption extends StatelessWidget {
  const CustomProfileOption({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffCF636C),
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: Color(0xffEEA3B1)),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Color(0xffCF636C)),
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                color: Color(0xffCF636C), size: 18),
          ],
        ),
      ),
    );
  }
}
