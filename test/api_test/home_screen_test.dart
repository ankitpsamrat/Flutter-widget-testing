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
      return users;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          futureUsers: tempUser(),
        ),
      ),
    );

    expect(CircularProgressIndicator, findsOneWidget);
  });
}
