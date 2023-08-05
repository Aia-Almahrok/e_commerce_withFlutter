import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:udemy_project/e_commerce/welcom.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
  //Myapp app=Myapp();
  // Bloc.observer=MyBlocObserver();
  // DioHelper.init();
  // DioHelper.getData();
}
class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(

     theme: ThemeData(

       bottomNavigationBarTheme:BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
         selectedItemColor: Colors.grey,
         elevation: 10,
       ),

     ),
     title: "Ecommerce",
     debugShowCheckedModeBanner: false,
     home:WelcomePage(),


   );
  }

}


