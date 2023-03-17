import 'package:flutter/material.dart';
import 'package:la_pic/screens/home_screen.dart';
import 'package:la_pic/screens/product_categories_screen.dart';
import 'package:la_pic/screens/product_details_screen.dart';
import 'package:la_pic/screens/cart_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_pic/screens/search_results_screen.dart';
import 'package:la_pic/screens/check_out_screen.dart';
import 'package:la_pic/screens/welcome_screen.dart';

void main() {
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
      home: WelcomeScreen(),
      routes: {
        // '/categories': (context) => CategoriesScreen(),
        // '/product': (context) => ProductScreen(),
        // '/cart': (context) => CartScreen(),
        // '/checkout': (context) => CheckoutScreen(),
        // '/reviews': (context) => ReviewsScreen(),
        // '/login': (context) => LoginScreen(),
        // '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
