import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/whole_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: AppColors.scaffoldColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/Frame 19.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Home',
              style: TextStyle(
                  fontFamily: 'CH',
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'About',
                style: TextStyle(
                    fontFamily: 'CH',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Services',
                style: TextStyle(fontSize: 14, color: Colors.white),
              )),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Price',
                style: TextStyle(fontSize: 14, color: Colors.white),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'News',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: WholeScreen(),
    );
  }
}
