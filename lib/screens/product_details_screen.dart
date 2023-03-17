import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.yellow),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Center(
          child: Text(
            'LaEpic Boutique',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_rounded, color: Colors.yellow),
            onPressed: () {},
          ),
        ],
      ),
      
      body:  Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                    top: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/item1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Versace',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$99.99',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),]),
                      const SizedBox(height: 20),
                      const Text(
                        'Product details and description',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,
                          color: Colors.grey,),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            'Size:',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 10),
                          buildSizeOption(context, 'S'),
                          buildSizeOption(context, 'M'),
                          buildSizeOption(context, 'L'),
                        ],
                      ),
                      const SizedBox(height: 20),

                       BottomAppBar(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 72,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    'BUY NOW',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.shopping_cart_rounded, color: Colors.yellow),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget buildSizeOption(BuildContext context, String size) {
    final bool isSelected = size == 'M';
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
