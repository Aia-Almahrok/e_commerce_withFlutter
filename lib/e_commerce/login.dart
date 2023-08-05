import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:udemy_project/e_commerce/home_page.dart';
import 'package:udemy_project/e_commerce/register.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent, // Updated color to deepPurpleAccent
        centerTitle: true,
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://img.freepik.com/premium-vector/illustration-cartoon-female-user-entering-login_241107-682.jpg',
                    width: 280,
                    height: 250,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Invalid email format';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.deepPurpleAccent), // Updated color to deepPurpleAccent
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.deepPurpleAccent, // Updated color to deepPurpleAccent
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurpleAccent), // Updated color to deepPurpleAccent
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password should be at least 6 characters long';
                            }
                            return null;
                          },
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.deepPurpleAccent), // Updated color to deepPurpleAccent
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.deepPurpleAccent, // Updated color to deepPurpleAccent
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.deepPurpleAccent, // Updated color to deepPurpleAccent
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurpleAccent), // Updated color to deepPurpleAccent
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                            activeColor: Colors.deepPurpleAccent, // Updated color to deepPurpleAccent
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(color: Colors.deepPurpleAccent), // Updated color to deepPurpleAccent
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Column( // Add Column here
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton( // Wrap ElevatedButton with Column
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                          FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)
                          .then((value){
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                            });


                            // Navigator.pushReplacement(context,
                            //   MaterialPageRoute(
                            //     builder: (context) => HomePage(),
                            //   ),
                            // );
                          }
                        },
                        child: const Text('Login', style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent), // Updated color to deepPurpleAccent
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>RegisterPage()),
                          );
                        },
                        child: Text(
                          'Don\'t have an account? Create one',
                          style: TextStyle(color: Colors.deepPurpleAccent), // Updated color to deepPurpleAccent
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
// class Aouthontication{
//   final auth=FirebaseAuth.instance;
//   signUp(String email,String password){
//     auth.createUserWithEmailAndPassword(email: email, password: password);
//   }
// }