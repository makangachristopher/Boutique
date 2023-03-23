// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
//
// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//
//   File? _profilePhoto;
//
//   String _errorMessage = '';
//   bool _isLoading = false;
//
//   Future<void> _signup() async {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();
//     final phoneNumber = _phoneNumberController.text.trim();
//     final firstName = _firstNameController.text.trim();
//     final lastName = _lastNameController.text.trim();
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       final userCredential =
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       final user = userCredential.user;
//       final userId = user!.uid;
//
//       if (_profilePhoto != null) {
//         final ref = FirebaseStorage.instance.ref().child('users').child(userId);
//
//         await ref.putFile(_profilePhoto!);
//         final downloadUrl = await ref.getDownloadURL();
//
//         await user.updatePhotoURL(downloadUrl);
//       }
//
//       await user.updateDisplayName('$firstName $lastName');
//
//       // Store additional user data, such as phone number, in a Firestore database
//       // or in the Firebase Realtime Database.
//
//       Navigator.pushReplacementNamed(context, '/home');
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         _errorMessage = e.message ?? 'An unknown error occurred';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   Future<void> _pickProfilePhoto() async {
//     final pickedFile =
//     await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _profilePhoto = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(height: 50.0),
//               Text(
//                 'Sign up',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40.0),
//                     ),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         GestureDetector(
//                           onTap: _pickProfilePhoto,
//                           child: Container(
//                             height: 120.0,
//                             width: 120.0,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Colors.grey,
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: _profilePhoto == null
//                                 ? Icon(Icons.camera_alt, size: 60.0, color: Colors.grey[300])
//                                 : ClipOval(
//                               child: Image.file(_profilePhoto, fit: BoxFit.cover),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Name',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Please enter your name';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) => _name = value,
//                         ),
//                         SizedBox(height: 20.0),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Email',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Please enter your email';
//                             }
//                             if (!EmailValidator.validate(value)) {
//                               return 'Please enter a valid email';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) => _email = value,
//                         ),
//                         SizedBox(height: 20.0),
//                         TextFormField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Please enter a password';
//                             }
//                             if (value.length < 6) {
//                               return 'Password must be at least 6 characters long';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) => _password = value,
//                         ),
//                         SizedBox(height: 20.0),
//                         ElevatedButton(
//                           onPressed: _submitForm,
//                           child: Text('Sign Up'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
