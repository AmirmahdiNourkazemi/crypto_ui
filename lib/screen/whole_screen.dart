import 'package:flutter/material.dart';

import 'sections/first_sections.dart';

class WholeScreen extends StatefulWidget {
  const WholeScreen({super.key});

  @override
  State<WholeScreen> createState() => _WholeScreenState();
}

class _WholeScreenState extends State<WholeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [FirstSection()],
    );
  }
}
