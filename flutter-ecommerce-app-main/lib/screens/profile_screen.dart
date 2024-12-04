import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            // Profile Icon
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/300', // Sample profile picture
              ),
            ),
            SizedBox(height: 16),
            // User Name
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(thickness: 1),
            ),
            // Profile Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text('Email'),
                    subtitle: Text('john.doe@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('Phone'),
                    subtitle: Text('+1 234 567 8901'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red),
                    title: Text('Address'),
                    subtitle: Text('1234 Elm Street, Springfield, USA'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.history),
                    label: Text('Order History'),
                    onPressed: () {
                      // Navigate to order history page (mock for now)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Order History clicked!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                    onPressed: () {
                      // Navigate to settings page (mock for now)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Settings clicked!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
