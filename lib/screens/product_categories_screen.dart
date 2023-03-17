import 'package:flutter/material.dart';
import 'package:la_pic/components/product_tab_items.dart';
import 'package:la_pic/components/drawer.dart';
import 'package:la_pic/components/items_list.dart';
import 'package:la_pic/components/bottom_menu.dart';

class ProductCategoriesPage extends StatefulWidget {
  const ProductCategoriesPage({super.key});

  @override
  ProductCategoriesPageState createState() => ProductCategoriesPageState();
}

class ProductCategoriesPageState extends State<ProductCategoriesPage> {
  final List<String> _itemsList =
      List.generate(40, (index) => 'assets/images/item${index % 10}.jpg');

  String _selectedCategory = 'All Products';
  final List<String> _categories = ['All Products', 'Clothes', 'Bags', 'Accessories'];
  final Map<String, List<String>> _subCategories = {
    'All Products': ['All Products'],
    'Clothes': ['Dresses', 'Tops', 'Trousers', 'Suits'],
    'Bags': ['Louis vuitton', 'Versace', 'Gucci', 'Hermes'],
    'Accessories': ['Bracelets', 'Anklets', 'Watches']
  };

  String _selectedSubCategory = 'All Products';
  List<DropdownMenuItem<String>> _subCategoryItems = [
    const DropdownMenuItem(
      value: 'All Products',
      child: Text('All products'),
    ),
  ];

  void updateSubCategories() {
    setState(() {
      _subCategoryItems = _subCategories[_selectedCategory]!
          .map(
            (subCategory) => DropdownMenuItem(
              value: subCategory,
              child: Text(subCategory),
            ),
          )
          .toList();
      _selectedSubCategory = _subCategoryItems.first.value!;
    });
  }

  void onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
      updateSubCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.yellow),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Product Categories',
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
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.0 + 16.0,
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),

          // TextField(
          //   decoration: InputDecoration(
          //     prefixIcon: Icon(Icons.search),
          //     hintText: 'Search',
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BuildTabItem(
                    title: _categories[index],
                    index: index,
                    value: _categories[index],
                    isActive: _categories[index] == _selectedCategory,
                    onTabSelected: onCategorySelected,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              value: _selectedSubCategory,
              items: _subCategoryItems,
              onChanged: (value) =>
                  setState(() => _selectedSubCategory = value!),
              decoration: InputDecoration(
                labelText: 'Subcategories',
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          BuildItemList(
            items: _itemsList,
          ),
          BuildBottomMenu()
        ],
      ),
    );
  }
}
