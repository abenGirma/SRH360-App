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
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: title == selectedCategory
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationThickness: title == selectedCategory ? 2.0 : 1.0,
        ),
      ),
    );
  }
}
