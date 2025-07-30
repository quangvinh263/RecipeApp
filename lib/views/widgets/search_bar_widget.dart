import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;

  const SearchBarWidget({
    super.key,
    this.hintText = 'Search',
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(2),
        border: _focusNode.hasFocus 
          ? Border.all(color: Color(0xFFCEA700), width: 2)
          : null,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search, 
            color: _focusNode.hasFocus 
              ? Color(0xFFCEA700) 
              : Colors.grey[500], 
            size: 20
          ),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              onChanged: (value) {
                setState(() {}); // Để cập nhật hiển thị nút clear
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              onSubmitted: widget.onSubmitted,
              onTap: widget.onTap,
            ),
          ),
          // Clear button - chỉ hiển thị khi có text
          if (_controller.text.isNotEmpty)
            GestureDetector(
              onTap: () {
                _controller.clear();
                setState(() {});
                if (widget.onChanged != null) {
                  widget.onChanged!('');
                }
              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}