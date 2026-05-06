import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    //Task 1: Build a small profile section using a Column with a username and short bio.
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            
            SizedBox(height: 20,),
            Stack(
              
              children: [
                
                Container(
                  margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(10),
                
                height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                       
                children: [
                  Text("Pugal"),
                  Text("Bio: Flutter Dev")
                ],
                      ),
                    ),
                SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                Text("Posts"),
                Text("Following"),
                Text("Followers")
                      ],
                    )
                
                
                  ],
                ),
              ),

              Positioned(
  top: 0,
  right: 3,
  child: Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.red,
      shape: BoxShape.circle,
    ),
    child: Text(
      "3",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
)
              ] 
            ),
          ],
        ),
      ),
    );

  }
}