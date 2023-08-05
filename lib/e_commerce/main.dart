import 'package:flutter/material.dart';
import 'package:udemy_project/e_commerce/cart.dart';
import 'package:udemy_project/e_commerce/categories.dart';
import 'package:udemy_project/e_commerce/home_page.dart';
import 'package:udemy_project/e_commerce/login.dart';
import 'package:udemy_project/e_commerce/profile.dart';
import 'package:udemy_project/e_commerce/register.dart';
import 'package:udemy_project/e_commerce/welcom.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the primary color to green
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/categories': (context) => CategoriesPage(),
        '/cart': (context) => CartPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}