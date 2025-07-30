import 'package:flutter/material.dart';

class RecipeCardWidget extends StatelessWidget {
  final String title;
  final String time;
  final String authorName;
  final double rating;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final bool isFavorite;

  const RecipeCardWidget({
    super.key,
    required this.title,
    required this.time,
    required this.authorName,
    this.rating = 5.0,
    this.onTap,
    this.onFavorite,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        height: 300,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFFFFFFF)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Card
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Background image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/video.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFD32F2F),
                                Color(0xFFB71C1C),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.restaurant,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                  // Dark overlay for better contrast
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                  
                  // Play button
                  Center(
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  
                  // Rating badge
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCEA700),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 12),
                          SizedBox(width: 4),
                          Text(
                            rating.toInt().toString(),
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 12),
            
            // Time info
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 6),
            
            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            
            SizedBox(height: 12),
            
            // Author info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/video.jpg', 
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            color: Colors.orange[700],
                            size: 20,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      authorName,
                      style: TextStyle(
                        color: Color(0xFFCEA700),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
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