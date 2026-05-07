import 'package:flutter/material.dart';

class ViewTask extends StatelessWidget {
  const ViewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),

      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 10,
            right: 10,
          ),
          color: Colors.black45,

          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("Hi"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("Hey"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("How are you?"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("I am fine. How about you?"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("Yeah good"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("Did you watch the match yesterday?"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("Yeah, the ending was crazy"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("I thought they were going to lose"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("Same 😄"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("That last goal was perfect"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("Best moment of the game"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime,
                    ),
                    height: 50,
                    width: 200,
                    child: Text("Totally worth staying up late"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}