import 'package:flutter/material.dart';
import 'MyDrawer.dart';
import 'newads.dart';
import 'myAds.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 4; // تبدأ من الرئيسية

  // القائمة المركزية التي تخزن كل الإعلانات
  List allAds = [];

  // وظيفة لإضافة إعلان جديد من صفحة newads
  void addNewAd(Map ad) {
    setState(() {
      allAds.add(ad);
      currentIndex = 1; // الانتقال تلقائياً لتبويب "إعلاناتي" بعد الإضافة
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentBody;

    if (currentIndex == 2) {
      // نمرر وظيفة الإضافة لصفحة newads
      currentBody = NewAds(onAdAdded: addNewAd);
    } else if (currentIndex == 1) {
      // نمرر القائمة المركزية لصفحة myAds
      currentBody = MyAds(ads: allAds);
    } else {
      currentBody = const Center(child: Text("مرحباً بك في عقارات اليمن", style: TextStyle(fontSize: 20)));
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("عقارات اليمن", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      endDrawer: const Mydrawer(),
      body: currentBody,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'المزيد'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity_outlined), label: 'إعلاناتي'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'إعلان جديد'),
          BottomNavigationBarItem(icon: Icon(Icons.gavel), label: 'مزايدة'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
        ],
      ),
    );
  }
}