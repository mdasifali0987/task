import 'package:flutter/material.dart';

import 'loginpage/log_mobile_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.orangeAccent.shade700,
          secondary: Colors.orangeAccent.shade700,
        ),
        useMaterial3: true,
      ),
      home: LogInMobileNo()
    );
  }
}
