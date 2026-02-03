import 'package:flutter/material.dart';
import 'package:tendhang_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Tendhang',
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFFEFCE8),
            secondary: const Color(0xFF0E7490),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: const Color(0xFF0E7490), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: const Color(0xFF0E7490), width: 2),
            ),
            floatingLabelStyle: const TextStyle(color: Colors.black),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color(0xFF0E7490),
            selectionHandleColor: Color(0xFF0E7490),
          ),
          snackBarTheme: const SnackBarThemeData(
            insetPadding: EdgeInsets.all( 16.0),
            backgroundColor: Color(0xFF0E7490),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            contentTextStyle: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w500),
            behavior: SnackBarBehavior.floating,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}
