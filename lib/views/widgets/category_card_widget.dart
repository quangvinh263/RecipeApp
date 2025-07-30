import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final String authorName;
  final String time;
  final IconData icon;
  final VoidCallback? onTap;

  const CategoryCardWidget({
    super.key,
    required this.title,
    required this.authorName,
    required this.time,
    this.icon = Icons.restaurant,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main container
          Container(
            width: 160,
            margin: EdgeInsets.only(right: 16, top: 40), 
            padding: EdgeInsets.only(top: 56, left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              color: Color(0xFFCEA700).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF734C10),
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 4),
                
                // Author info
                Text(
                  'Tạo bởi',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF432805),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  authorName,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF432805),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 30),
                
                // Bottom info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Time
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF734C10),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Bookmark icon
                    Container(
                      width: 28,
                      height: 28,
                      child: Icon(
                        Icons.message_outlined,
                        size: 22,
                        color: Color(0xFF734C10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Circular image positioned on top
          Positioned(
            top: 0,
            left: (160 - 80) / 2, // Center horizontally
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/category.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4CAF50),
            Color(0xFF2E7D32),
          ],
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}