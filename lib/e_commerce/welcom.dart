import 'package:flutter/material.dart';
import 'package:udemy_project/e_commerce/login.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopEasy'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: 100,
                left: 50,
                right: 50,
                child: FadeTransition(
                  opacity: _animation,
                  child: Column(
                    children: [
                      Image.network('https://freedesignfile.com/upload/2019/11/E-commerce-cartoon-illustration-vector.jpg',
                        //'https://animationexplainers.com/wp-content/uploads/2021/07/p8-bg1.png',
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Discover',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.deepPurpleAccent),
                      ),
                      Text(
                        'Explore world top brands and boutiques',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: TextButton(
                  onPressed: () {
                    // Add skip button logic here
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: ElevatedButton(
                  onPressed: () {
                    _startAnimation();
                    Future.delayed(Duration(milliseconds: 500), () {
                      Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=>LoginPage()),
                      );
                    });
                  },
                  child: Text('Next'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                    elevation: MaterialStateProperty.all<double>(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}