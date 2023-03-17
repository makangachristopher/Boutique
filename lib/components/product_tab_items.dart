import 'package:flutter/material.dart';


class BuildTabItem extends StatelessWidget {
  const BuildTabItem({
    Key? key,
    required this.title,
    required this.index,
    required this.onTabSelected,
    required this.value,
    required this.isActive,
  }) : super(key: key);

  final String value;
  final String title;
  final int index;
  final Function(String category) onTabSelected;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabSelected(value);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.yellow),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
//
// class BuildTabItem extends StatefulWidget {
//   const BuildTabItem({
//     Key? key,
//     required this.title,
//     required this.index,
//     required this.onTabSelected,
//   }) : super(key: key);
//
//   final String title;
//   final int index;
//   final Function(int index) onTabSelected;
//
//   @override
//   BuildTabItemState createState() => BuildTabItemState();
// }
//
// class BuildTabItemState extends State<BuildTabItem> {
//   int currentTab = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isActive = currentTab == widget.index;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           currentTab = widget.index;
//         });
//         widget.onTabSelected(widget.index);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: isActive ? Colors.yellow : Colors.white,
//           borderRadius: BorderRadius.circular(20.0),
//           border: Border.all(color: Colors.yellow),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         child: Text(
//           widget.title,
//           style: TextStyle(
//             color: isActive ? Colors.white : Colors.grey,
//             fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// // class BuildTabItem extends StatelessWidget {
// //   const BuildTabItem({Key? key, required this.title, required this. index}) : super(key: key);
// //
// //
// //   final String title;
// //   final int index;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     int currentTab = 1;
// //     final bool isActive = currentTab == index;
// //   return Container(
// //     decoration: BoxDecoration(
// //       color: isActive ? Colors.yellow : Colors.white,
// //       borderRadius: BorderRadius.circular(20.0),
// //       border: Border.all(color: Colors.yellow),
// //     ),
// //     padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
// //     child: Text(
// //       title,
// //       style: TextStyle(
// //         color: isActive ? Colors.white : Colors.grey,
// //         fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
// //       ),
// //     ),
// //   );
// // }
// // }