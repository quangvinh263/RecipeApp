import 'package:flutter/material.dart';
import '../widgets/search_item.dart';

class Search2Page extends StatefulWidget {
  final String? initialQuery;
  
  const Search2Page({super.key, this.initialQuery});

  @override
  State<Search2Page> createState() => _Search2PageState();
}

class _Search2PageState extends State<Search2Page> {
  final TextEditingController _searchController = TextEditingController();
  
  // Filter state
  Set<String> selectedCategories = {'Danh mục 1'};
  Set<String> selectedIngredients = {'Thịt gà'};
  Set<String> selectedAreas = {'Long An'};
  
  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialQuery ?? 'Bánh táo';
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
              // Search Bar with Filter
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                                if (value.isEmpty) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
              
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  IconButton(
                    icon: Icon(
                      Icons.filter_list_alt,
                      color: Color(0xFFCEA700),
                      size: 36,
                    ),
                    onPressed: () {
                      _showFilterBottomSheet(context);
                    },
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              
              // Recipe Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 1.0,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SearchItem(
                      title: 'Salad bò kiểu Thái',
                      author: 'Little Pony',
                      cookingTime: '20m',
                      isFavorite: true,
                      onTap: () {
                        // Handle recipe tap
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Tapped on Thai Beef Salad')),
                        );
                      },
                      onFavoriteToggle: () {
                        // Handle favorite toggle
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Favorite toggled')),
                        );
                      },
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

    void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                // Handle bar
                Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                
                // Header
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                                'Lọc',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFFCEA700).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  selectedCategories.clear();
                                  selectedIngredients.clear();
                                  selectedAreas.clear();
                                });
                              },
                              child: Text(
                                'Đặt lại',
                                style: TextStyle(
                                  color: Color(0xFFCEA700),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey[300],
                        margin: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Danh mục section
                        _buildFilterSectionModal(
                          'Danh mục',
                          [
                            'Danh mục 1',
                            'Danh mục 2', 
                            'Danh mục 3',
                            'Danh mục 4',
                          ],
                          selectedItems: selectedCategories,
                          setModalState: setModalState,
                        ),
                        
                        SizedBox(height: 24),
                        
                        // Nguyên liệu section
                        _buildFilterSectionModal(
                          'Nguyên liệu',
                          [
                            'Thịt gà',
                            'Thịt heo',
                            'Danh mục',
                            'Ức gà',
                            'Chân gà',
                          ],
                          selectedItems: selectedIngredients,
                          setModalState: setModalState,
                        ),
                        
                        SizedBox(height: 24),
                        
                        // Khu vực section
                        _buildFilterSectionModal(
                          'Khu vực',
                          [
                            'TP.HCM',
                            'Bình Phước',
                            'Đồng Nai',
                            'An Giang',
                            'Long An',
                          ],
                          selectedItems: selectedAreas,
                          setModalState: setModalState,
                        ),
                        
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
                // Bottom button
                Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {}); // Update main page state
                        Navigator.pop(context);
                        // Apply filters
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCEA700),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Xác nhận',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterSectionModal(String title, List<String> items, {Set<String>? selectedItems, required StateSetter setModalState}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.bookmark,
              color: Colors.grey[600],
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items.map((item) {
            bool isSelected = selectedItems?.contains(item) ?? false;
            return GestureDetector(
              onTap: () {
                setModalState(() {
                  if (title == 'Danh mục') {
                    if (selectedCategories.contains(item)) {
                      selectedCategories.remove(item);
                    } else {
                      selectedCategories.add(item);
                    }
                  } else if (title == 'Nguyên liệu') {
                    if (selectedIngredients.contains(item)) {
                      selectedIngredients.remove(item);
                    } else {
                      selectedIngredients.add(item);
                    }
                  } else if (title == 'Khu vực') {
                    if (selectedAreas.contains(item)) {
                      selectedAreas.remove(item);
                    } else {
                      selectedAreas.add(item);
                    }
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFCEA700) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected 
                    ? Border.all(color: Color(0xFFCEA700), width: 0.8)
                    : Border.all(color: Colors.grey, width: 0.8),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w400 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

}
