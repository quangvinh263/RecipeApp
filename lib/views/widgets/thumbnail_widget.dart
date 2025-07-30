import 'package:flutter/material.dart';

class ThumbnailWidget extends StatelessWidget {
  const ThumbnailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/thumbnail.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}