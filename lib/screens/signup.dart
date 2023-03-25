import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late String _userName;
  late String _email;
  late String _phoneNumber;
  late String _password;
  late String _confirmPassword;
  bool _isLoading = false;
  String? _photoUrl;
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      // continue with the signup process


      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        await _firestore.collection('users').doc(newUser.user?.uid).set({
          'username': _userName,
          'email': _email,
          'phone_number': _phoneNumber,
          'profile_photo': '',
        });
        Navigator.of(context).pushReplacementNamed('/home');
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
    child: Text(
    'Sign up',
    style: TextStyle(fontSize: 32.0),
    ),
    ),
    Container(
    padding: EdgeInsets.all(20.0),
    margin: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    ),
    ),
    child: Form(
    key: _formKey,
    child: Column(
    children: <Widget>[
    TextFormField(
    decoration: InputDecoration(labelText: 'Username'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your username';
    }
    return null;
    },
    onSaved: (value) {
    _userName = value?.trim() ?? '';
    },
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Email'),
    validator: (value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
    return 'Please enter a valid email address';
    }
    return null;
    },
    onSaved: (value) {
    _email = value?.trim() ?? '';
    },
    ),
    TextFormField(
    decoration:
    InputDecoration(labelText: 'Phone Number'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
    }
    return null;
    },
    onSaved: (value) {
    _phoneNumber = value?.trim() ?? '';
    },
    )
,
    TextFormField(
    decoration: InputDecoration(labelText: 'Password'),
    obscureText: true,
    validator: (value) {
    if (value == null ||value.isEmpty || value.length < 6) {
    return 'Password must be at least 6 characters long';
    }
    return null;
    },
    onSaved: (value) {
    _password = value?.trim() ?? '';
    },
    ),
    TextFormField(
    decoration:
    InputDecoration(labelText: 'Confirm Password'),
    obscureText: true,
    validator: (String? value) {
      if (value!.isEmpty) {
        return 'Please enter your password again';
      } else if (value != _passwordController.text) {
        return 'Passwords do not match';
      }
      return null;
    },
      onSaved: (String? value) {
        _confirmPassword = value!;
      },
    ),
      SizedBox(
        height: 20.0,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Phone Number'),
        keyboardType: TextInputType.phone,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please enter your phone number';
          }
          return null;
        },
        onSaved: (String? value) {
          _phoneNumber = value!;
        },
      ),
      SizedBox(
        height: 20.0,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Profile Photo'),
        keyboardType: TextInputType.url,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please enter a valid photo url';
          }
          return null;
        },
        onSaved: (String? value) {
          _photoUrl = value!;
        },
      ),
      SizedBox(
        height: 20.0,
      ),
      ElevatedButton(
        onPressed: _submitForm,
        child: Text('Submit'),
      ),
      SizedBox(
        height: 20.0,
      ),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Text('Already have an account? Login'),
      ),
    ],
    ),
    ),
    ),
   ] ),
    ));
  }
}
