import 'package:flutter/material.dart';
import 'package:testing/animation_test/animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widget Testing',
      home: AnimationScreen(),
      // home: CounterHomePage(),
      // home: HomeScreen(
      //   futureUsers: UserRepository().fetchUsers(),
      // ),
    );
  }
}
