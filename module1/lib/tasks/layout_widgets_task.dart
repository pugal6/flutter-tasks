import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("Pugal"),
                SizedBox(height: 10,),
                Text("Flutter Dev"),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("1.8K"),
                       Text("Followers"),
                       ],
                    ),
                   
                   SizedBox(width: 50,),
                   Column(
                    children: [
                      Text("100K"),
                      Text("Followers")
                    ],
                   )
                  ],
                ),
          
          
          SizedBox(height: 50,),
          
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Column(
                        children: [
                          Text("Biriyani"),
                          SizedBox(height: 20,),
                          Text("Mani's Dum Biriyani"),
                          Text("Janakiram"),
                          Text("SS Hyderabad Biriyani")
                        ],
                      ),
                      
          
                      Column(
                        children: [
                          Text("Pizza"),
                          SizedBox(height: 20,),
                          Text("PizzaHut"),
                          Text("Dominos"),
                          Text("Oyolo")
                        ],
                      ),
          
          
                      Column(
                        children: [
                          Text("Burger"),
                          SizedBox(height: 20,),
                          Text("KFC"),
                          Text("McD"),
                          Text("Burger King")
                        ],
                      ),
                    ],
                  ),
                ),
          
          
                SizedBox(height: 50,),
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Center(
                
                child: Text("Yaarodu Yaaro"),
              ),
          
              Center(
                
                child: Text("Yuvan"),
              ),
          
              SizedBox(height: 20,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          Text("Previous"),
          Text("Play/Pause"),
          Text("Next")
                ],
              )
            ],
          ),
          
          
          SizedBox(height: 50,),
          
          Column(
            children: [
              Stack(
                alignment: AlignmentGeometry.topRight,
                children:[
           Text("Message",
                style: TextStyle(
          backgroundColor: Colors.amber
                ),),
                Text("1")
                ]
              )
            ],
          )
              ],
          
            ),
          
          ),
        ),
      ),
    );
  }
  
}