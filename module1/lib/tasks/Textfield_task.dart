import 'package:flutter/material.dart';

class TextfieldTask extends StatelessWidget{
  const TextfieldTask({super.key});
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
            title: const Text("TextField Practice Tasks"),
          ),

          body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ---------------- TASK 1 ----------------

          const Text(
            "1. Login Screen",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // ---------------- TASK 2 ----------------

          const Text(
            "2. Food Delivery Search",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              hintText: "Search food items",
             
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Search"),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // ---------------- TASK 3 ----------------

          const Text(
            "3. Mini Profile Editor",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Bio",
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            ),
          ),
        ],
      ),
    ),
    ),
   
    
  );
}
}