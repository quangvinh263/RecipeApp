import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String title;
  final String author;
  final String cookingTime;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  const SearchItem({
    super.key,
    required this.title,
    required this.author,
    required this.cookingTime,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container with favorite button
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    height: 130.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Image.asset(
                      'assets/images/search.png',  
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[400],
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Favorite button
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF).withOpacity(0.75),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey[600],
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Content section
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  // Author and cooking time row
                  Row(
                    children: [
                      Text(
                        'By $author',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Spacer(),
                      // Cooking time with icon
                      Row(
                        children: [
                          Icon(
                              Icons.access_time,
                              color: Color(0xFFCEA700),
                              size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            cookingTime,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
