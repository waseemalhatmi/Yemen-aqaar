import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          drawerHeader(context),
          drawerItem(
            icon: Icons.home,
            title: 'الرئيسية',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget drawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const Text("waseem alhatmi"),
      accountEmail: const Text("waseemalhatmi@gmail.com"),
      currentAccountPicture: const CircleAvatar(
        radius: 80,
        backgroundColor: Colors.white,
        child: Icon(Icons.person, size: 50), // بدلاً من الصورة لضمان عمل الكود لديك
      ),
      decoration: BoxDecoration(color: Colors.blue[400]),
    );
  }

  Widget drawerItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}