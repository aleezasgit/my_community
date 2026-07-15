part of 'notification.dart';

enum NotificationType {
  like,
  upload,
  friendRequest,
  livestream,
  comment,
  joinApproved
}

final List<Map<String, dynamic>> todayNotificationsData = [
  {
    'id': 'today_1',
    'type': NotificationType.like,
    'title': 'Ahmed liked your post',
    'time': '30 min ago',
    'avatar': 'assets/pngs/Frame 2147229685.png',
  },
  {
    'id': 'today_2',
    'type': NotificationType.upload,
    'title': 'Your story is uploaded successfully',
    'time': '2 min ago',
    'avatar': 'assets/pngs/Frame 2147229685.png',
  },
  {
    'id': 'today_3',
    'type': NotificationType.friendRequest,
    'title': 'Ahmed sent you friend request',
    'time': '2 min ago',
    'avatar': 'assets/pngs/Frame 2147229685.png',
  },
];

final List<Map<String, dynamic>> yesterdayNotificationsData = [
  {
    'id': 'yesterday_1',
    'type': NotificationType.livestream,
    'title': 'Noam Laish is live now',
    'time': '30 min ago',
    'avatar': 'assets/pngs/Frame 2147229685.png',
  },
  {
    'id': 'yesterday_2',
    'type': NotificationType.comment,
    'title': 'Ahmed commented on your post',
    'time': '30 min ago',
    'avatar': 'assets/pngs/Frame 2147229685.png',
  },
  {
    'id': 'yesterday_3',
    'type': NotificationType.friendRequest,
    'title': 'Ahmed sent you friend request',
    'time': '2 min ago',
    'avatar': 'assets/pngs/Frame 2147229685.png',
  },
  {
    'id': 'yesterday_4',
    'type': NotificationType.joinApproved,
    'title': 'Your community join request is approved now',
    'time': '30 min ago',
    'avatar': 'assets/pngs/Frame 2147229685.png',
  },
];