// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flowershop/shared/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

// Global theme notifier
ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentTheme, child) {
        return MaterialApp(
          title: 'Flower Shop',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Colors.white, // Light mode background
            primaryColor: Color(0xFFFFACB7), 
            secondaryHeaderColor:Colors.white, 
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black), // Light mode text color
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: const Color.fromARGB(255, 47, 46, 46), // Dark mode background
            primaryColor: Color.fromARGB(255, 148, 89, 113), 
            secondaryHeaderColor: Color.fromARGB(223, 198, 191, 191), 
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Color.fromARGB(255, 228, 221, 185)), // Dark mode text color
              bodyMedium: TextStyle(color: Colors.white),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black, // Dark mode app bar color
              iconTheme: IconThemeData(color: Colors.white),
            ),
          ),
          themeMode: currentTheme, // Dynamically switch themes on clicking the moon/sun icons.
          home: Homepage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
