import 'package:flutter/material.dart';
import 'package:udemy_project/e_commerce/login.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/premium-vector/women-avatars-cartoons-with-purple-black-blond-hair-design_24640-63156.jpg?w=2000'),
            ),
            SizedBox(height: 20),
            Text(
              'Error Team',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'ErrorTeam@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showLogoutConfirmationDialog(context);
              },
              child: Text('Logout'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.deepPurpleAccent)),
            ),
            ElevatedButton(
              onPressed: () {
                // Close the dialog and navigate to the login page
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Logout'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
              ),
            ),
          ],
        );
      },
    );
  }

}