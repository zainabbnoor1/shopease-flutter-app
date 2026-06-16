import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You can fetch real user info here later (e.g., from Firebase)
    const String userEmail = "user@example.com";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=3', // dummy profile image
              ),
            ),
            const SizedBox(height: 10),
            Text(userEmail, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),

            // ⚙️ Settings
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // You can add actual settings screen later
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Settings screen coming soon!")),
                );
              },
            ),

            const Divider(),

            // 🚪 Logout
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Optional: clear user session/token here
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
