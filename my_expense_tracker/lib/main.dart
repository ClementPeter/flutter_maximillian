import 'package:my_expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//used to create various color pallete to be used in our appb-> Light mode color scheme
ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

//Dark mode color scheme
ColorScheme kDarkModeColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',

      //Dark Theme
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme:
            kDarkModeColorScheme.copyWith(error: kDarkModeColorScheme.error),
        scaffoldBackgroundColor: kDarkModeColorScheme.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkModeColorScheme.primaryContainer,
          foregroundColor: kDarkModeColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkModeColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkModeColorScheme.primary,
            foregroundColor: kDarkModeColorScheme.onPrimary,
          ),
        ),
      ),
      //TODO : Ask chatgpt benefit of both

      //using theming w/o copyWith involves modifying other values
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   scaffoldBackgroundColor: Colors.black,
      //   useMaterial3: true,
      // ),

      //Light theme
      //using .copyWith our app theming stays consistent all round
      //and we only modify theme parameters that we need
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme.copyWith(error: kColorScheme.error),
        //scaffoldBackgroundColor: const Color.fromARGB(255, 220, 189, 252),
        scaffoldBackgroundColor: kColorScheme.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary,
          ),
        ),
        //Text theming is probably not a mess afterall
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),

        //Text theming is a mess in flutter - Prefarably style as you create your Text
        // textTheme: const TextTheme().copyWith(
        //   titleLarge: const TextStyle(
        //     fontWeight: FontWeight.normal,
        //     //color: kColorScheme.secondaryContainer,
        //     color: Colors.green,
        //     fontSize: 24,
        //   ),
        //   //headlineMedium: const TextStyle(color: Colors.yellow),
        //   //bodyMedium: const TextStyle(color: Colors.red),
        // ),

        //colorScheme -> overriding error color theme for dismissbile
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}
