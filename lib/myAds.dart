import 'dart:io';
import 'package:flutter/material.dart';

class MyAds extends StatelessWidget {
  final List ads;
  const MyAds({super.key, required this.ads});

  @override
  Widget build(BuildContext context) {
    return ads.isEmpty
        ? const Center(child: Text("لا توجد إعلانات مضافة بعد"))
        : ListView.builder(
            itemCount: ads.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: FileImage(ads[index]['image'] as File),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        textDirection: TextDirection.rtl,

                        children: [
                          Text(
                            ads[index]['title'],  style: const TextStyle(  fontWeight: FontWeight.bold,  fontSize: 16),
                          ),
                           SizedBox(height: 3),
                          Text("السعر  : ${ads[index]['price']}"),
                           SizedBox(height: 3),
                           Text("التفاصيل : ${ads[index]['details']}"),
                          SizedBox(height: 3),
                          Text("الموقع  : ${ads[index]['location']}"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}