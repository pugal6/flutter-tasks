import 'package:flutter/material.dart';

class ImageIconTask extends StatelessWidget{

  const ImageIconTask({super.key});
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //Profile header with icon,  image, username
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
            
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        //backgroundImage: NetworkImage("Url of an image you want to show"),
                        child: Icon(Icons.person),
                      ),
            
                      SizedBox(width: 12),
            
                      Text(
                        "Pugal",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            
                    ],
                  ),
                ),
            
            
                SizedBox(height: 20),
            
            
                //food delivery card showing a food image, a favorite icon, and the restaurant name.
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
            
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTalXjBOwCfgEqezCndga3zDOE7ZdIa1HQt-g&s=10")),
                      ),
            
                      SizedBox(width: 12),
            
                      Text(
                        "California Burrito",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            
                    SizedBox(width: 240),
            
                      Icon(Icons.favorite_border),
                    ],
                  ),
                ),
            
               // Music player section
            SizedBox(height: 40),
            
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
            
              child: Column(
                children: [
            
                  // Album Image
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              //fit: BoxFit.cover,
              image: NetworkImage(
                "https://pbs.twimg.com/media/Gr2visGXAAApms2.jpg",
              ),
            ),
                    ),
                  ),
            
                  SizedBox(height: 20),
            
                  // Song Name
                  Text(
                    "Oru Naalil",
                    style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  SizedBox(height: 8),
            
                  // Artist Name
                  Text(
                    "Yuvan",
                    style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
                    ),
                  ),
            
                  SizedBox(height: 25),
            
                  // Music Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            
            Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 40,
            ),
            
            SizedBox(width: 20),
            
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 35,
              ),
            ),
            
            SizedBox(width: 20),
            
            Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 40,
            ),
                    ],
                  ),
                ],
              ),
            )
              ],
            ),
          ),
        ),
      );
  }
  
}