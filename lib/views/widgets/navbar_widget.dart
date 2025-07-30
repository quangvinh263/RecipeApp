import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  const NavbarWidget({
    super.key, 
    required this.selectedIndex, 
    required this.onItemSelected
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10.0,
      color: Colors.white,
      elevation: 10.0,
      child: SizedBox(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Icon
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? Color(0xFFCEA700) : Colors.grey,
                  size: 28,
                ),
                onPressed: () => onItemSelected(0),
              ),
            ),
            // Search Icon  
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: selectedIndex == 1 ? Color(0xFFCEA700) : Colors.grey,
                  size: 28,
                ),
                onPressed: () => onItemSelected(1),
              ),
            ),
            // Spacer for center button
            SizedBox(width: 80), 
            // Bookmark Icon
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.bookmark_outline,
                  color: selectedIndex == 3 ? Color(0xFFCEA700) : Colors.grey,
                  size: 28,
                ),
                onPressed: () => onItemSelected(3),
              ),
            ),
            // Profile Icon
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: selectedIndex == 4 ? Color(0xFFCEA700) : Colors.grey,
                  size: 28,
                ),
                onPressed: () => onItemSelected(4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Static method để tạo FloatingActionButton
  static Widget buildFloatingActionButton({
    required int selectedIndex,
    required Function(int) onItemSelected,
  }) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFCEA700), Color(0xFFEFD503)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(32.5),
          onTap: () => onItemSelected(2),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}