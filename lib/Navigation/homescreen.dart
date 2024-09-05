
import 'package:flutter/material.dart';

class HomescreenPage extends StatefulWidget {
  const HomescreenPage({super.key});

  @override
  _HomescreenPageState createState() => _HomescreenPageState();
}

class _HomescreenPageState extends State<HomescreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(height: 10),
            _buildImageCarousel(),
            const SizedBox(height: 10),
            _buildKycPendingBox(),
            const SizedBox(height: 20),
            _buildCategoryIcons(),
            const SizedBox(height: 20),
            _buildExclusiveForYouSection(), // Exclusive product section
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  AppBar _buildAppBar() {
  return AppBar(
    backgroundColor:Colors.white,
    elevation: 1,
    leading: IconButton(
      icon: const Icon(Icons.menu, color: Colors.black),
      onPressed: () {},
    ),
    title: Container(
      height: 45, 
      decoration: BoxDecoration(
        color: Colors.transparent, 
        borderRadius: BorderRadius.circular(30), 
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16), 
      child: TextField(
        decoration: InputDecoration(
          filled: true, 
          fillColor: Color.fromARGB(255, 217, 213, 213), 
          hintText: 'Search here',
          suffixIcon: const Icon(Icons.search, color: Colors.black), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), 
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications, color: Colors.black),
        onPressed: () {},
      ),
    ],
  );
}


Widget _buildImageCarousel() {
  return Container(
    height: 150, // Height remains the same
    color: Colors.grey.shade200,
    padding: const EdgeInsets.symmetric(horizontal: 20), // Padding to adjust horizontal space
    child: PageView(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/Screenshot 2024-09-05 180954.png',
            fit: BoxFit.cover,
            width: double.infinity, // Width reduced inside a centered PageView
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/Screenshot 2024-09-05 180954.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ],
    ),
  );
}


  Widget _buildKycPendingBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF6468d2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'KYC Pending',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'You need to provide the required documents \nfor your account activation.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Handle "Click Here" action
              },
              child: Center(
                child: Text(
                  'Click Here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildCategoryIcon(Icons.phone_android, 'Mobile', Colors.red),
          _buildCategoryIcon(Icons.laptop, 'Laptop', Colors.blue),
          _buildCategoryIcon(Icons.camera_alt, 'Camera', Colors.green),
          _buildCategoryIcon(Icons.tv, 'LED', Colors.orange),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label, Color backgroundColor) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: backgroundColor,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _buildExclusiveForYouSection() {
    return Container(
      color:Color.fromARGB(255, 103, 151, 190),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'EXCLUSIVE FOR YOU',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(), 
                  Icon(
                    Icons.arrow_forward, 
                    color: Colors.white, 
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildProductCard(
                  productName: 'Nokia 8.1 (Iron, 64GB)', 
                  discount: '32% Off', 
                  image: 'assets/Screenshot 2024-09-06 002107.png',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String productName,
    required String discount,
    required String image,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const Text(
              '₹12,999', 
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Handle Chat action
      },
      backgroundColor: Colors.red,
      child: Icon(Icons.chat,color: Colors.white,),
    );
  }
}



