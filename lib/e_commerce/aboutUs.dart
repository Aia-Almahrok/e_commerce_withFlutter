import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'About Us',

          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body:Center(
          child: ElevatedButton(onPressed: (){
            showDialog(context: context,
                builder: (context){
                  return const AlertDialog(
                    title: Text('About Us'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/premium-vector/women-avatars-cartoons-with-purple-black-blond-hair-design_24640-63156.jpg?w=2000'),

                          radius: 20,
                        ),
                        SizedBox(height: 8,),
                        Text('Team Members:',style: TextStyle(color: Colors.deepPurpleAccent),),
                        SizedBox(height: 5,),
                        Text('Marwa Elsayed \n Eman Fathy \n Aia Saad',textAlign: TextAlign.center,)

                      ],
                    ),
                  );
                });
          }, child: const Text('About Us'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),)
          ),
        ));
  }
}