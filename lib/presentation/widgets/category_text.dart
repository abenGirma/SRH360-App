import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String title;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryText(this.title, BuildContext context, this.selectedCategory,
      this.onCategorySelected,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCategorySelected(title),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 2.0,
              color:
                  title == selectedCategory ? Colors.black : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
