import 'package:flutter/material.dart';

class CategoryTabsWidget extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CategoryTabsWidget({
    super.key,
    required this.categories,
    this.selectedIndex = 0,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFCEA700) : Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? Color(0xFFCEA700) : Colors.grey[300]!,
                ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[600],
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}