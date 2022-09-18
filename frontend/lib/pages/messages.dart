import 'users.dart';

class messageExchange {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  messageExchange({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

List<messageExchange> chats = [
  messageExchange(
    sender: user1,
    time: '5:30 PM',
    text: 'Hey! All good? We can book a consultation for tomorrow if needed.',
    unread: true,
  ),
  messageExchange(
    sender: user2,
    time: '4:30 PM',
    text: 'Don\'t worry, everything will be alright.',
    unread: true,
  ),
  messageExchange(
    sender: user3,
    time: '1:30 PM',
    text: 'I don\'t like stacked pancakes.',
    unread: false,
  ),
];

List<messageExchange> messages = [
  messageExchange(
    sender: user1,
    time: '5:30 PM',
    text: 'All good! Good bye!',
    unread: true,
  ),
  messageExchange(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Sure! Thanks a lot! Will keep you posted.',
    unread: true,
  ),
  messageExchange(
    sender: user1,
    time: '3:45 PM',
    text:
        'I do consultations on sundays. Let me know if there\'s anything you need help with. I could hop on your teams channel for a quick meeting.',
    unread: true,
  ),
  messageExchange(
    sender: user1,
    time: '3:15 PM',
    text: 'Good that it\'s all right now!',
    unread: true,
  ),
  messageExchange(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Will let you know if I have any progress',
    unread: true,
  ),
  messageExchange(
    sender: currentUser,
    time: '2:30 PM',
    text: 'I think I had a few doubts regarding the thing I\'m working on.',
    unread: true,
  ),
  messageExchange(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Yes! On track.',
    unread: true,
  ),
  messageExchange(
    sender: user1,
    time: '2:00 PM',
    text: 'Hey! All good?',
    unread: true,
  ),
];
