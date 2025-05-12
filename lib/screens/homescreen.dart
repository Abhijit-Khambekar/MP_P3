import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AK Store!! (Logo-like Text)
            Text(
              'AK Store!!',
              style: GoogleFonts.pacifico(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 10),
            // Tagline
            Text(
              'Where one can buy anything!!',
              style: GoogleFonts.lobster(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.blue[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
