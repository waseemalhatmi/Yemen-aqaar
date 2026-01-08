import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewAds extends StatefulWidget {
  final Function(Map) onAdAdded;
  const NewAds({super.key, required this.onAdAdded});

  @override
  State<NewAds> createState() => _NewAdsState();
}

class _NewAdsState extends State<NewAds> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  // اختيار صورة من المعرض
  Future<void> pickImage() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // مربع إضافة الصورة
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                        image: selectedImage != null
                            ? DecorationImage(
                                image: FileImage(selectedImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: selectedImage == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_a_photo,
                                    size: 40, color: Colors.grey),
                                SizedBox(height: 8),
                                Text("إضافة صورة الشقة",
                                    style:
                                        TextStyle(color: Colors.grey)),
                              ],
                            )
                          : null,
                    ),
                  ),

                  const SizedBox(height: 20),

                  customTextField(
                    controller: titleController,
                    label: "عنوان الإعلان",
                    hint: "مثال: شقة للإيجار",
                    icon: Icons.title,
                  ),
                  customTextField(
                    controller: priceController,
                    label: "السعر",
                    hint: "ادخل السعر",
                    icon: Icons.attach_money,
                    inputType: TextInputType.number,
                  ),
                  customTextField( controller: detailsController,label: "التفاصيل", hint: "مثال : غرفتين -مطبخ - حمام ", icon: Icons.description, maxLines: 2, ),

                  const SizedBox(height: 10),

                  customTextField(controller: locationController, label: "الموقع", hint: "الدولة - المحافظة - المنطقة", icon: Icons.location_pin),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (titleController.text.isEmpty ||
                          selectedImage == null) return;

                      widget.onAdAdded({
                        'title': titleController.text,
                        'price': priceController.text,
                        'details': detailsController.text,
                        'location':locationController.text,
                        'image': selectedImage,
                      });

                      titleController.clear();
                      priceController.clear();
                      detailsController.clear();
                      locationController.clear();


                      setState(() {
                        selectedImage = null;
                      });
                    },
                    child:  Text("إضافة الإعلان",style:TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customTextField({
  required TextEditingController controller,
  required String label,
  required String hint,
  required IconData icon,
  TextInputType inputType = TextInputType.text,
  int maxLines = 1,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.red),
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    ),
  );
}