import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample list of image URLs (you can replace it with your actual data)
  final List<String> _imageUrls = [
    'https://cdn.shopify.com/s/files/1/1551/9675/files/001-ancient-greek-black-figure-chalcidian-krater-CEGR3001012_17922b34-fabe-42b9-867a-1200402b77e2_480x480.jpg?v=1634905930',
    'https://crewsproject.files.wordpress.com/2017/01/2.jpg?w=1080',
    'https://cdn.shopify.com/s/files/1/0249/5017/7845/files/Traditional_Indian_Jewellery_of_Indian_heritage_jewellery_large.jpg?v=1578478921',
    'https://www.egyptsouvenir.com/images/Brass%20Plates/musician%20girls-800.jpg',
    'https://avarts.tv/wp-content/uploads/Jug_front.jpg',
    'https://avarts.tv/wp-content/uploads/Tell-el-Yahudiya_-Ware_Juglet_front.jpg',
    'https://en.bcdn.biz/Images/2018/3/21/efd9fe94-8e75-4369-a7e6-f769a04ed21e.jpg',

    // Add more image URLs as needed
  ];

  final List<String> _productNames = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
    'Product 7',
    // Add more product names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Historical Things',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: _buildHorizontalList(),
            ),
            SizedBox(height: 250,)
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _imageUrls.length,
      itemBuilder: (context, index) {
        return _buildCard(_imageUrls[index], _productNames[index]);
      },
    );
  }

  Widget _buildCard(String imageUrl, String productName) {
    return Container(
      width: 410,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                ),
                child: Text(
                  productName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
