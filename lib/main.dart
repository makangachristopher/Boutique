import 'package:flutter/material.dart';
import 'package:la_pic/screens/home_screen.dart';
import 'package:la_pic/screens/product_categories_screen.dart';
import 'package:la_pic/screens/product_details_screen.dart';
import 'package:la_pic/screens/cart_screen.dart';
import 'package:la_pic/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_pic/screens/search_results_screen.dart';
import 'package:la_pic/screens/check_out_screen.dart';
import 'package:la_pic/screens/welcome_screen.dart';
import 'package:la_pic/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.white,
        ),
        // Define the default TextTheme. Use the 'Montserrat' font.

        textTheme:  GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow,
        ),
      ),
      home: SignupScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/categories': (context) => ProductCategoriesPage(),
        '/search': (context) => SearchPage(),
        '/product': (context) => ProductDetailsScreen(),
        '/cart': (context) => CartScreen(),
        '/checkout': (context) => CheckoutScreen(),
        // '/notifications': (context) => NotificationsScreen(),
        // '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        // '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
