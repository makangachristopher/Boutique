// import 'package:flutter/material.dart';
//
// class ProductCategoriesPage extends StatefulWidget {
//   @override
//   _ProductCategoriesPageState createState() => _ProductCategoriesPageState();
// }
// class _ProductCategoriesPageState extends State<ProductCategoriesPage> {
//   String _searchQuery = '';
//   int _selectedCategoryIndex = 0;
//   int _selectedSubCategoryIndex = 0;
//
//   List<String> _categories = [
//     'All Products',
//     'Electronics',
//     'Fashion',
//     'Books',
//   ];
//
//   Map<String, List<String>> _subCategories = {
//     'All Products': ['All Products'],
//     'Electronics': [
//       'All Electronics',
//       'Mobile Phones',
//       'Laptops',
//       'Accessories',
//     ],
//     'Fashion': ['All Fashion', 'Men', 'Women', 'Kids'],
//     'Books': ['All Books', 'Fiction', 'Non-Fiction'],
//   };
//
//   Map<String, List<String>> _items = {
//     'All Products': [
//       'Product 1',
//       'Product 2',
//       'Product 3',
//       'Product 4',
//       'Product 5',
//       'Product 6',
//     ],
//     'Mobile Phones': ['Phone 1', 'Phone 2', 'Phone 3'],
//     'Laptops': ['Laptop 1', 'Laptop 2', 'Laptop 3'],
//     'Accessories': ['Accessory 1', 'Accessory 2', 'Accessory 3'],
//     'Men': ['Shirt', 'Trousers', 'Shoes', 'Watch'],
//     'Women': ['Dress', 'Sandals', 'Handbag', 'Jewelry'],
//     'Kids': ['Toy 1', 'Toy 2', 'Clothes'],
//     'Fiction': ['Book 1', 'Book 2', 'Book 3'],
//     'Non-Fiction': ['Book 4', 'Book 5', 'Book 6'],
//   };
//
//   List<String> _subCategoryItems = [];
//   String _selectedSubCategory = 'All Products';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Categories'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           _buildSearchTab(),
//           _buildMenuTabs(),
//           _buildSubCategoryTabs(),
//           Expanded(
//             child: _buildItemsList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchTab() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: 'Search',
//           prefixIcon: Icon(Icons.search),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//         onChanged: (value) {
//           setState(() {
//             _searchQuery = value;
//           });
//         },
//       ),
//     );
//   }
//
//   Widget _buildMenuTabs() {
//     return Container(
//       height: 50.0,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: _categories.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: ChoiceChip(
//               label: Text(_categories[index]),
//               selected: _selectedCategoryIndex == index,
//               onSelected: (isSelected) {
//                 setState(() {
//                   _selectedCategoryIndex = isSelected ? index : 0;
//                   _selectedSubCategoryIndex = 0;
//                   _selectedCategoryIndex = isSelected ? index : 0;
//                   _subCategoryItems = _subCategories[_categories[index]] ?? [];
//                   _selectedSubCategory = _subCategoryItems[0];
//                   _items = _allItems
//                       .where((item) =>
//                   item.category == _categories[_selectedCategoryIndex] &&
//                       item.subCategory == _selectedSubCategory)
//                       .toList();
//                 });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildSubCategoryTabs() {
//     return Container(
//       height: 50.0,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: _subCategoryItems.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: ChoiceChip(
//               label: Text(_subCategoryItems[index]),
//               selected: _selectedSubCategoryIndex == index,
//               onSelected: (isSelected) {
//                 setState(() {
//                   _selectedSubCategoryIndex = isSelected ? index : 0;
//                   _selectedSubCategory = _subCategoryItems[_selectedSubCategoryIndex];
//                   _items = _allItems
//                       .where((item) =>
//                   item.category == _categories[_selectedCategoryIndex] &&
//                       item.subCategory == _selectedSubCategory)
//                       .toList();
//                 });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildItemsList() {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: _items.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             leading: Image.asset(_items[index].image),
//             title: Text(_items[index].name),
//             subtitle: Text(_items[index].description),
//             trailing: Text(
//               '$${_items[index].price.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             onTap: () {
// // Navigate to the details page
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Categories'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
// // Open search page
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           _buildMenuTabs(),
//           _buildSubCategoryTabs(),
//           _buildItemsList(),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
