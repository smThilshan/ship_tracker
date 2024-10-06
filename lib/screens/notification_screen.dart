import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = 'notification_screen';

  // Hardcoded list of ship tracking notifications
  final List<ShipNotification> _notifications = [
    ShipNotification(
      title: 'Ship Departure Alert',
      description: 'The ship "Sea Explorer" has departed from the harbor.',
      dateTime: DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    ShipNotification(
      title: 'Arrival Update',
      description:
          'The ship "Ocean Voyager" will arrive at the destination in 3 hours.',
      dateTime: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    ShipNotification(
      title: 'Weather Advisory',
      description:
          'A storm warning has been issued for the area where "Wave Rider" is currently located.',
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ShipNotification(
      title: 'Cargo Status',
      description:
          'The cargo for ship "Cargo King" has been successfully loaded.',
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ShipNotification(
      title: 'Maintenance Notification',
      description:
          'Scheduled maintenance for "Shipshape" will begin at 10 AM tomorrow.',
      dateTime: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  ShipNotification notification = _notifications[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: _buildNotificationCard(context, notification),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context, ShipNotification notification) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatDateTime(notification.dateTime),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return 'No date available';
    }
    Duration difference = DateTime.now().difference(dateTime);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}

// Updated Notification class for ship tracking
class ShipNotification {
  final String title;
  final String description;
  final DateTime dateTime;

  ShipNotification({
    required this.title,
    required this.description,
    required this.dateTime,
  });
}
