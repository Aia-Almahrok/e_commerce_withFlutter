import 'package:flutter/material.dart';
import 'package:udemy_project/e_commerce/aboutUs.dart';
import 'package:udemy_project/e_commerce/cart.dart';
import 'package:udemy_project/e_commerce/categories.dart';
import 'package:udemy_project/e_commerce/profile.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    //HomePageContent(),
    CategoriesPage(),
    CartPage(),
    ProfilePage(),
    AboutUs(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
        title: Text('Home'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      )
          : null, // Hide the app bar for other tabs except the Home Page
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.deepPurpleAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: [

          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.home, color: Colors.white),
            ),
            label: 'Home',
            backgroundColor: Colors.deepPurpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
            label: 'Cart',
            backgroundColor: Colors.deepPurpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.person, color: Colors.white),
            ),
            label: 'Profile',
            backgroundColor: Colors.deepPurpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.info, color: Colors.white),
            ),
            label: 'About Us',
            backgroundColor: Colors.deepPurpleAccent,
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Home Page!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class BrandCategoriesPage extends StatelessWidget {
  final String brandName;

  BrandCategoriesPage({required this.brandName});

  // Sample categories for each brand
  final List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    // Add more categories here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brandName),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the products page for the selected category
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsPage(
                    brandName: brandName,
                    category: categories[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(categories[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  final String brandName;
  final String category;

  ProductsPage({required this.brandName, required this.category});

  @override
  Widget build(BuildContext context) {
    // Here you can fetch the products for the selected category and display them
    return Scaffold(
      appBar: AppBar(
        title: Text('$brandName - $category'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Text('Products for $brandName - $category'),
      ),
    );
  }
}