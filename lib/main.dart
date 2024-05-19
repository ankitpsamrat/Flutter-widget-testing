import 'package:flutter/material.dart';
import 'package:testing/api_test/home_screen.dart';
import 'package:testing/api_test/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widget Testing',
      home: HomeScreen(
        futureUsers: UserRepository().fetchUsers(),
      ),
    );
  }
}
