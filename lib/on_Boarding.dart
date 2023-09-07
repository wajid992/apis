import 'dart:async';

import 'package:backend_proj/Signin.dart';
import 'package:backend_proj/home%20.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.only(right: 20),
        height: 100,
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: const Size(40, 40)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Signin()));
          },
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
            size: 20.0,
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 202)),
            Image.asset(
              "assets/mainimg.png",
              height: 254,
              width: 204,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Welcome',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                'hello hopes that you are doing well welcome to our application ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
