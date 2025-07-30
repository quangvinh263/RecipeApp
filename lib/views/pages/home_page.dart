import 'package:flutter/material.dart';
import 'package:recipe_app/views/widgets/search_bar_widget.dart';
import 'package:recipe_app/views/widgets/section_header_widget.dart';
import 'package:recipe_app/views/widgets/video_widget.dart';
import 'package:recipe_app/views/widgets/category_tabs_widget.dart';
import 'package:recipe_app/views/widgets/category_card_widget.dart';
import 'package:recipe_app/views/widgets/recent_recipes_card.dart';
import 'package:recipe_app/views/pages/search1_page.dart';
import 'package:recipe_app/views/pages/detail_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryIndex = 0;
  int selectedIngredientIndex = 0;
  int selectedNavIndex = 0;

  @override
  void initState() {
    super.initState();
    // Reset to home tab when returning to this page
    selectedNavIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Search Bar
              SearchBarWidget(
                hintText: 'Tìm kiếm sản phẩm',
                onChanged: (value) {
                  // Khi có text thì chuyển sang search page
                  if (value.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search1Page(initialQuery: value),
                      ),
                    );
                  }
                },
                onTap: () {
                  // Navigate to search page khi tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search1Page(),
                    ),
                  );
                },
              ),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TP. Hồ Chí Minh Section
                      SectionHeaderWidget(
                        title: 'TP. Hồ Chí Minh',
                        actionText: 'Xem tất cả',
                        onActionTap: () {
                          // Navigate to all recipes
                        },
                      ),
                      SizedBox(height: 16),
                      _buildHorizontalRecipeList(),
                      
                      SizedBox(height: 32),
                      
                      // Danh mục Section
                      SectionHeaderWidget(
                        title: 'Danh mục',
                        actionText: 'Xem tất cả',
                        onActionTap: () {
                          // Navigate to all categories
                        },
                      ),
                      SizedBox(height: 16),
                      CategoryTabsWidget(
                        categories: ['Danh mục 1', 'Danh mục 2', 'Danh mục 3', 'Danh mục 4'],
                        selectedIndex: selectedCategoryIndex,
                        onTabSelected: (index) {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      _buildCategoryGrid(),
                      
                      SizedBox(height: 32),
                      
                      // Công thức gần đây Section
                      SectionHeaderWidget(title: 'Công thức gần đây'),
                      SizedBox(height: 16),
                      RecentRecipesCard(),
                      
                      SizedBox(height: 32),
                      
                      // Nguyên liệu Section
                      SectionHeaderWidget(title: 'Nguyên liệu'),
                      SizedBox(height: 16),
                      _buildIngredientSection(),
                      SizedBox(height: 100), // Space for navbar
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  Widget _buildHorizontalRecipeList() {
    return SizedBox(
      height: 340,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return RecipeCardWidget(
            title: 'Cách chiên trứng một cách cung phu',
            time: '1 tiếng 20 phút',
            authorName: 'Đinh Trọng Phúc',
            rating: 5.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(),
                ),
              );
            },
            onFavorite: () {
              // Toggle favorite
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return CategoryCardWidget(
            title: 'Trứng chiên',
            authorName: 'Trần Đình Trọng',
            time: '20 phút',
            onTap: () {
              // Navigate to category detail
            },
          );
        },
      ),
    );
  }

  Widget _buildIngredientSection() {
    final List<String> ingredients = [
      'Danh mục 1',
      'Danh mục 2', 
      'Danh mục',
      'Danh mục 3',
      'Danh mục 1',
      'Danh mục 2',
      'Danh mục',
      'Danh mục 3',
    ];

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(4, (index) {
              final isSelected = selectedIngredientIndex == index;
              return Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFCEA700) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Color(0xFFCEA700) : Colors.grey[300]!,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIngredientIndex = index;
                    });
                  },
                  child: Text(
                    ingredients[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[700],
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        
        SizedBox(height: 10),
        
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(4, (index) {
              final tabIndex = index + 4;
              final isSelected = selectedIngredientIndex == tabIndex;
              return Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFCEA700) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Color(0xFFCEA700) : Colors.grey[300]!,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIngredientIndex = tabIndex;
                    });
                  },
                  child: Text(
                    ingredients[tabIndex],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[700],
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}