import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
        
              const SizedBox(height: 16),
        
              const Text(
                'Alex Johnson',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              const SizedBox(height: 8),
        
              const Text(
                'Premium Member',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
        
              const SizedBox(height: 30),
        
              Card(
                child: ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favorite Shows'),
                  subtitle: const Text('12 saved shows'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
        
              const SizedBox(height: 12),
        
              Card(
                child: ListTile(
                  leading: const Icon(Icons.download),
                  title: const Text('Downloads'),
                  subtitle: const Text('5 offline movies'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
        
              const SizedBox(height: 12),
        
              Card(
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  subtitle: const Text('Manage account preferences'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
        
              const SizedBox(height: 30),
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}