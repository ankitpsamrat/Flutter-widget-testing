import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/api_test/home_screen.dart';
import 'package:testing/api_test/user_model.dart';

void main() {
  testWidgets('Display list of user with title as name and subtitle as email.',
      (tester) async {
    final users = [
      User(id: 1, name: 'Ankit', email: 'ankit@gmail.com'),
      User(id: 2, name: 'Pratap', email: 'pratap@gmail.com'),
      User(id: 3, name: 'Samrat', email: 'samrat@gmail.com'),
    ];

    Future<List<User>> tempUser() async {
      return Future.delayed(const Duration(seconds: 1), () {
        return users;
      });
    }

    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          futureUsers: tempUser(),
        ),
      ),
    );

    // check CircularProgressIndicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();

    // check listview
    expect(find.byType(ListView), findsOneWidget);

    // check listtile
    expect(find.byType(ListTile), findsNWidgets(users.length));

    // check user details
    for (final user in users) {
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
    }
  });
}
