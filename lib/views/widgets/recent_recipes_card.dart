import 'package:flutter/material.dart';

class RecentRecipesCard extends StatelessWidget {
  const RecentRecipesCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - có thể thay bằng data thật từ API
    final List<Map<String, String>> recipes = [
      {
        'title': 'Trứng chiên',
        'author': 'Nguyễn Đình Trọng',
        'image': 'assets/images/recipes.jpg',
      },
      {
        'title': 'Trứng chiên',
        'author': 'Nguyễn Đình Trọng',
        'image': 'assets/images/recipes.jpg',
      },
      {
        'title': 'Trứng chiên',
        'author': 'Nguyễn Đình Trọng',
        'image': 'assets/images/recipes.jpg',
      },
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          
          return Container(
            width: 140,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image container
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        recipe['image']!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.restaurant,
                                color: Colors.grey[600],
                                size: 40,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 10),
                
                // Title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    recipe['title']!,
                    style: TextStyle(
                      color: Color(0xFF734C10),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                
                SizedBox(height: 4),
                
                // Author info
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          recipe['author']!,
                          style: TextStyle(
                            color: Color(0xFF002D73),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}