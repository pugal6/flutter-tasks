

import 'package:flutter/material.dart';

class FoodDiscoveryApp extends StatelessWidget {

  const FoodDiscoveryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text("Hello Pugal"),
                      Text("Coimbatore, Tamil nadu"),
                ],
              ),
              SizedBox(width: 280,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(18)
                  
                ),
                height: 20,
                width: 20,
                child: Center(
                  child: Text("P"),
                ),
              )
            ],
          ),
          
          
          SizedBox(height: 100,),
          
          
                 Stack(
            children: [
          
              // Banner background
              Container(
                height: 140,
                width: 480,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
          
              // Floating badge
              Positioned(
                top: 10,
                left: 10,
          
                child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),

          decoration: BoxDecoration(
color: Colors.indigo,
borderRadius: BorderRadius.circular(15)
          ),
          
          
          
          child: Text("LIMITED"),
                ),
              ),
          
              // Bottom texts
              Positioned(
                left: 14,
                bottom: 15,
          
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("50% Off Today"),
            Text("On selected restaurants"),
          ],
                ),
              ),
            ],
          ),
          
          
          
          SizedBox(height: 80,),
          
          
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
          margin: EdgeInsets.only(
            left: 10
          ),
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
            
          ),
            
          child: Container(
             padding: EdgeInsets.only(
              top:20,
              left: 10
             ),
            child: Text("Burger")
            ),
                ),
          
          
                Container(
          margin: EdgeInsets.only(
            left: 10
          ),
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
            
          ),
            
          child: Container(
             padding: EdgeInsets.only(
              top:20,
              left: 10
             ),
            child: Text("Chicken")),
                ),
          
          
                Container(
          margin: EdgeInsets.only(
            left: 10
          ),
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
            
          ),
            
          child: Container(
             padding: EdgeInsets.only(
              top:20,
              left: 10
             ),
            child: Text("Paneer")),
                ),
          
          
                Container(
          margin: EdgeInsets.only(
            left: 10
          ),
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
            
          ),
            
          child: Container(
             padding: EdgeInsets.only(
              top:20,
              left: 10
             ),
            child: Text("Fish")),
                ),
          
          
                Container(
          margin: EdgeInsets.only(
            left: 10
          ),
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
            
          ),
            
          child: Container(
             padding: EdgeInsets.only(
              top:20,
              left: 10
             ),
            child: Text("Mutton")),
                ),
          
          
                SizedBox(height: 80,),
          
          
          
               
              ],
            ),


            
          ),

          SizedBox(height: 60,),

           SizedBox(
          height: 700,
          
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1,
            children: [
              Stack(
                 fit: StackFit.expand,
                children:[
                 
                  Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrangeAccent,
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("McD"),
                
                    SizedBox(height: 8),
                
                    Text("25 mins"),
                
                    Text("4.5 rating"),
                  ],
                ),
                ),

                 Positioned(top: 10,
                  right: 15,
                  child: Container(
                    height: 20,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("fav")),
                  ), ),
                ] 
              ),


             Container(
              padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrangeAccent,
                ),
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("Burger King"),

    SizedBox(height: 8),

    Text("25 mins"),

    Text("4.5 rating"),
  ],
),
              ),


             Container(
              padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrangeAccent,
                ),
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("SS Biriyani"),

    SizedBox(height: 8),

    Text("25 mins"),

    Text("4.5 rating"),
  ],
),
              ),
Container(
  padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrangeAccent,
                ),
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("RR Biriyani"),

    SizedBox(height: 8),

    Text("25 mins"),

    Text("4.5 rating"),
  ],
),
              ),


            ],
          ),
                )
            ]
                ),
        ),
    )
    );
  }
  
}