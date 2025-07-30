import 'package:flutter/material.dart';
import 'package:recipe_app/views/pages/detail_page.dart';
import '../widgets/video_widget.dart';

class SaveRecipesPage extends StatefulWidget {
  const SaveRecipesPage({super.key});

  @override
  State<SaveRecipesPage> createState() => _SaveRecipesPageState();
}

class _SaveRecipesPageState extends State<SaveRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        title: Text(
          'Công thức',
          style: TextStyle(
            color: Color(0xFFA47804),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), 
          child: Container(
            color: Color(0xFFE0E0E0),
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCEA700),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Video',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCEA700).withOpacity(0.15),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Công thức',
                        style: TextStyle(
                          color: Color(0xFFCEA700),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 16),
              
              // Video List  
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: RecipeCardWidget(
                        title: 'Cách chiên trứng một cách cung phụ',
                        time: '1 tiếng 20 phút',
                        authorName: 'Dinh Trong Phúc',
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
                          // Handle favorite tap  
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Favorite tapped')),
                          );
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
}
