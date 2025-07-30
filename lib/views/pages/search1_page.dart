import 'package:flutter/material.dart';
import 'package:recipe_app/views/widget_tree.dart';

class Search1Page extends StatefulWidget {
  final String? initialQuery;
  
  const Search1Page({super.key, this.initialQuery});

  @override
  State<Search1Page> createState() => _Search1PageState();
}

class _Search1PageState extends State<Search1Page> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<String> searchSuggestions = [
    'Pizza hến xào',
    'Pipi đứt lò',
    'Pizza thơm',
    'Pizza hải sản',
    'Pizza thịt xông khói',
  ];

  @override
  void initState() {
    super.initState();
    // Set initial query nếu có, ngược lại set 'Pi'
    _searchController.text = widget.initialQuery ?? 'Pi';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey[600],
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        onChanged: (value) {
                          setState(() {});
                          // Nếu xóa hết text thì quay về home
                          if (value.isEmpty) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => WidgetTree()),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 20),
              
              // Search Suggestions
              Expanded(
                child: ListView.builder(
                  itemCount: searchSuggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = searchSuggestions[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 1),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        title: Text(
                          suggestion,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.chevron_right,
                            color: Color(0xFFCEA700),
                            size: 20,
                          ),
                        ),
                        onTap: () {
                          // Handle suggestion tap
                          _searchController.text = suggestion;
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
