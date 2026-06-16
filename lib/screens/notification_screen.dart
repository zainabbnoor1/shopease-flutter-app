import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy notification list
    final List<Map<String, String>> notifications = [
      {
        'title': '🔥 Price Drop!',
        'message': 'iPhone 13 is now available at \$899 on Amazon!',
      },
      {
        'title': '🎯 New Recommendation',
        'message': 'Check out the new MacBook Air deals picked for you.',
      },
      {
        'title': '🎁 Promotion',
        'message': 'Get 20% off on Smart Watches this weekend only!',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple.shade50,
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: const Icon(Icons.notifications_active),
            title: Text(notification['title'] ?? ''),
            subtitle: Text(notification['message'] ?? ''),
            trailing: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Notification dismissed")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
