import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/property_repository.dart';
import 'presentation/property_list/property_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // For simplicity, providing the repository here.
    // For larger apps, use get_it or another DI solution.
    return RepositoryProvider(
      create: (context) => PropertyRepository(),
      child: MaterialApp(
        title: 'Real Estate App',
        theme: ThemeData(
            primarySwatch: Colors.teal, // Or any color you like
            // You can customize the theme further
            textTheme: const TextTheme(
              // Example of customizing text styles
              headlineSmall: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(fontSize: 16.0),
              bodyMedium: TextStyle(fontSize: 14.0),
            )
        ),
        home: const PropertyListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}