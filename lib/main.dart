import 'package:flutter/material.dart';
import 'screens/landing_page.dart'; // Import class LandingPage dari file terpisah

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siertify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingPage(), // Panggil LandingPage sebagai halaman utama
      debugShowCheckedModeBanner: false,
    );
  }
}
