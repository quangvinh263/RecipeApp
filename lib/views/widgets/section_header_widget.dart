import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onActionTap;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.actionText = '',
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        if (actionText.isNotEmpty)
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionText,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFCEA700),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}