// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AddPropertyPage extends StatefulWidget {
//   const AddPropertyPage({Key? key}) : super(key: key);

//   @override
//   State<AddPropertyPage> createState() => _AddPropertyPageState();
// }

// class _AddPropertyPageState extends State<AddPropertyPage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController descriptionController =
//       TextEditingController();

//   final ImagePicker picker = ImagePicker();
//   File? image;

//   Future<void> pickImage() async {
//     final XFile? picked =
//         await picker.pickImage(source: ImageSource.gallery);

//     if (picked != null) {
//       setState(() {
//         image = File(picked.path);
//       });
//     }
//   }

//   @override
//   void dispose() {
//     titleController.dispose();
//     priceController.dispose();
//     descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("إضافة إعلان جديد"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: titleController,
//                 decoration: const InputDecoration(
//                   labelText: "عنوان الشقة",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "الحقل مطلوب";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: priceController,
//                 decoration: const InputDecoration(
//                   labelText: "السعر",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: descriptionController,
//                 decoration: const InputDecoration(
//                   labelText: "وصف الشقة",
//                   border: OutlineInputBorder(),
//                 ),
//                 maxLines: 4,
//               ),
//               const SizedBox(height: 16),
//               image == null
//                   ? OutlinedButton.icon(
//                       onPressed: pickImage,
//                       icon: const Icon(Icons.image),
//                       label: const Text("إضافة صورة"),
//                     )
//                   : ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.file(
//                         image!,
//                         height: 200,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("تم حفظ الإعلان بنجاح"),
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text("نشر الإعلان"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }