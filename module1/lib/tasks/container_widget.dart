import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget{

  const ContainerWidget({super.key});
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                    
                  ),
                  child: Column(
                    children: [
                      
                      Text("Pugal"),
                
                      Text("Software developer"),
                
                      Text("1K"),
                      Text("Followers")
                
                    ],
                  ),
                ),
            
            
                SizedBox(height: 50,),
            
                Container(
                  width: 900,
                  height: 80,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal
                  ),   
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Zomato"),
                      Text("Order Food"),
            
                      
                    ],
                  ),
            
                  
                ),
            
                SizedBox(height: 10,),
            
                Container(
                  width: 900,
                  height: 80,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal
                  ),   
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Instagram"),
                      Text("MrX__Alpha_ followed you"),
            
                      
                    ],
                  ),
            
                  
                ),
            
                SizedBox(height: 10,),
            
            
            
                Container(
                  width: 900,
                  height: 80,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal
                  ),   
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Youtube"),
                      Text("New Video"),
            
                      
                    ],
                  ),
            
                  
                ),
            
                SizedBox(height: 10,),
            
            
            
                Container(
                  width: 900,
                  height: 80,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal
                  ),   
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Weather"),
                      Text("38 deg in chennai"),
            
                      
                    ],
                  ),
            
                  
                ),
            
                SizedBox(height: 10,),



                 Container(
                  width: 900,
                  height: 80,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal
                  ),   
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gmail"),
                      Text("Weekly news letter"),
            
                      
                    ],
                  ),
            
                  
                ),
              ],
            ),
          ),
        ),
      );
  }
  
}