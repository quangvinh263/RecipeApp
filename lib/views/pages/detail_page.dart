import 'package:flutter/material.dart';
import 'package:recipe_app/views/widgets/thumbnail_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 180,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Chi tiết',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/video.jpg',
            fit: BoxFit.cover,
            width: 393,
            height: 288,
          ),
          SizedBox(height: 8),
          _buildImageThumbnails(),
          SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe Title and Favorite
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cách chiên trứng một cách cung phu',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Cách chiên trứng một cách cung phu',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.favorite_border,
                          size: 28,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 16),
                    
                    // Rating and Reviews
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          '4.2',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 16,
                          color: Colors.grey[400],
                        ),
                        SizedBox(width: 8),
                        Text(
                          '120 đánh giá',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Author
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person, color: Colors.grey[600]),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.favorite, color: Colors.red, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'Đinh Trọng Phúc',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber[700],
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Divider
                    Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: 
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFFCEA700),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Nguyên liệu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Chế biến',
                              style: TextStyle(
                                color: Color(0xFFCEA700),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Serving info
                    Text(
                      'Dành cho 2-4 người ăn',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    // Ingredients list
                    _buildIngredientItem('300g chân gà, luộc trong 20 phút'),
                    _buildIngredientItem('2 chiếc xúc xích bò'),
                    _buildIngredientItem('5 viên thịt bò'),
                    _buildIngredientItem('100g bánh sắn, luộc cho đến khi mềm'),
                    _buildIngredientItem('1 quả trứng đánh tan'),
                    _buildIngredientItem('50 cải xanh, cắt thành 4 miếng'),
                    
                    SizedBox(height: 24),
                    
                    Text(
                      'Đối với bột gia vị',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    _buildIngredientItem('15g tỏi'),
                    _buildIngredientItem('3g mắm tôm'),
                    _buildIngredientItem('25g hành tím'),
                    _buildIngredientItem('50g gừng thơm'),
                    _buildIngredientItem('100g ớt độ lớn'),
                    _buildIngredientItem('50g ớt cay'),
                    _buildIngredientItem('7g muối'),
                    _buildIngredientItem('15g đường'),
                    _buildIngredientItem('15g hành tây chiên'),
                    _buildIngredientItem('25g bột gà'),
                    _buildIngredientItem('50ml dầu ăn'),
                    
                    SizedBox(height: 32),
                    
                    // Watch video button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFCEA700).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded, 
                            color: Color(0xFFCEA700)
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Xem video',
                            style: TextStyle(
                              color: Color(0xFFCEA700),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildImageThumbnails() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return ThumbnailWidget();
        },
      ),
    );
  }
  
  Widget _buildIngredientItem(String ingredient) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        ingredient,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[700],
          height: 1.5,
        ),
      ),
    );
  }
}
    