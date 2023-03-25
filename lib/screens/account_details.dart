import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  late User? _user;
  late String _userName;
  late String _email;
  late String _phoneNumber;
  late String _photoUrl;
  File? _imageFile;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  void _getUserDetails() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _user = _auth.currentUser;
      final snapshot =
      await _firestore.collection('users').doc(_user!.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      _userName = data['username'];
      _email = data['email'];
      _phoneNumber = data['phone_number'];
      _photoUrl = data['profile_photo'];
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        if (_imageFile != null) {
          final storageRef = FirebaseStorage.instance
              .ref()
              .child('profile_photos')
              .child(_user!.uid);
          final uploadTask = storageRef.putFile(_imageFile!);
          final snapshot = await uploadTask.whenComplete(() => null);
          _photoUrl = await snapshot.ref.getDownloadURL();
        }
        await _firestore.collection('users').doc(_user!.uid).update({
          'username': _userName,
          'email': _email,
          'phone_number': _phoneNumber,
          'profile_photo': _photoUrl,
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Changes saved successfully')));
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
    Navigator.pop(context);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
      return SafeArea(
          child: Container(
              child: new Wrap(
                  children: <Widget>[
              new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text('Photo Library'),
              onTap: () {
                _pickImage(ImageSource.gallery);
              }),
          new ListTile(
          leading: new Icon(Icons.photo_camera),
    title: new Text('Camera'),
    onTap: () {
    _pickImage(ImageSource.camera);
    },
          ),
                  ],
              ),
          ),
      );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () => _showPicker(context),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                    _imageFile != null
                        ? FileImage(_imageFile!) as ImageProvider<Object>?
                        : NetworkImage(_photoUrl) as ImageProvider<Object>?,
                  ),
                ),

                SizedBox(height: 16),
                TextFormField(
                  initialValue: _userName,
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _userName = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  initialValue: _email,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  initialValue: _phoneNumber,
                  decoration:
                  InputDecoration(labelText: 'Phone number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _saveChanges,
                  child: Text('Save changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





