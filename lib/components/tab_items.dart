import 'package:flutter/material.dart';

class BuildTabItem extends StatelessWidget {
  const BuildTabItem({
    Key? key,
    required this.title,
    required this.index,
    required this.onTabSelected,
    required this.isActive,
  }) : super(key: key);

  final String title;
  final int index;
  final Function(int index) onTabSelected;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabSelected(index);
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

