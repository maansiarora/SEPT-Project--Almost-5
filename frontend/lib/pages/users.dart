class User {
  final int id;
  final String name;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.isOnline,
  });
}

final User currentUser = User(
  id: 0,
  name: 'User',
  isOnline: true,
);

final User user1 = User(
  id: 1,
  name: 'Liza Tawaf',
  isOnline: true,
);

final User user2 = User(
  id: 2,
  name: 'Homy',
  isOnline: true,
);

final User user3 = User(
  id: 3,
  name: 'Timmy Wiley',
  isOnline: false,
);
