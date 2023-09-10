import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//used to create various color pallete to be used in our app
ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      //TODO : Ask chatgpt benefit of both

      //using theming w/o copyWith involves modifying other values
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   scaffoldBackgroundColor: Colors.black,
      //   useMaterial3: true,
      // ),

      //using .copyWith our app theming stays consistent all round
      //and we only modify theme parameters that we need
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 220, 189, 252),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary,
          ),
        ),

        //Text theming is a mess in flutter - Prefarably style as you create your Text
        // textTheme: const TextTheme().copyWith(
        //   titleLarge: TextStyle(
        //     fontWeight: FontWeight.normal,
        //     color: kColorScheme.secondaryContainer,
        //     fontSize: 24,
        //   ),
        //   //headlineMedium: const TextStyle(color: Colors.yellow),
        //   //bodyMedium: const TextStyle(color: Colors.red),
        // ),
        //error color theme for dismissbile
        colorScheme: kColorScheme.copyWith(error: kColorScheme.error),
      ),
      home: const Expenses(),
    );
  }
}
