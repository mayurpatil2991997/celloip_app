import 'package:celloip_task/core/routes.dart';
import 'package:celloip_task/screens/home/home_screen.dart';
import 'package:celloip_task/screens/list_data/list_data_screen.dart';
import 'package:celloip_task/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        CTRoutes.home: (context) => const HomeScreen(),
        CTRoutes.login: (context) => const LoginScreen(),
        CTRoutes.list_data: (context) => const ListScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
