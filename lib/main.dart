import 'package:flutter/material.dart';
import 'package:learning_app/screens/splash.dart';
import 'package:learning_app/screens/home.dart';
import 'package:learning_app/screens/cursos.dart';
import 'package:learning_app/screens/blogs.dart';
import 'package:learning_app/screens/login.dart';
import 'package:learning_app/screens/about.dart';
import 'package:learning_app/screens/contact.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code & Lens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => const Home(),
        '/cursos': (context) => const Cursos(),
        '/blogs': (context) => const Blogs(),
        '/login': (context) => const Login(),
        '/about': (context) => const About(),
        '/contact': (context) => const Contact(),
      }
    );
  }
}

