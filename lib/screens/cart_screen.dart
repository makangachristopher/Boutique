import 'package:flutter/material.dart';
import 'package:la_pic/components/cart_item.dart';
import 'package:la_pic/components/drawer.dart';
import 'package:la_pic/components/bottom_menu.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.yellow),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Center(
            child: Text(
              'Cart',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              onPressed: () {},
            ),
          ],
        ),
        drawer: const drawer(),
        body: ListView(
          children: const [
            BuildCartItem(
              name: 'Versace',
              image: 'assets/images/item1.jpg',
              price: 10.99,
              isSelected: true,
            ),
            BuildCartItem(
              name: 'Gucci',
              image: 'assets/images/item1.jpg',
              price: 15.99,
              isSelected: true,
            ),
            BuildCartItem(
              name: 'Polo',
              image: 'assets/images/item1.jpg',
              price: 8.99,
              isSelected: true,
            ),
            SizedBox(
              height: 20,
            ),
            Payment_button()
          ],
        ),
        bottomNavigationBar: BuildBottomMenu());
  }
}

class Payment_button extends StatelessWidget {
  const Payment_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Total: \$35.97',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
            child: const Text(
              'Buy Now',
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
