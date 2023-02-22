import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EatPage extends StatelessWidget {
  const EatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'กินอะไรดี',
          style: GoogleFonts.prompt(fontSize: 30),
        ),
      ),
    );
  }
}
