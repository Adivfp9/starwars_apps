import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/species');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              top: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                color: Colors.black,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset('assets/images/splash_logo.png'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: -120,
                left: 100,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Colors.blueGrey.withOpacity(0.1)),
                )),
            Positioned(
                top: -50,
                left: 0,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue[100]!.withOpacity(0.1)),
                )),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      color: Colors.blue[100]!.withOpacity(0.1)),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * (75 / 100),
                right: MediaQuery.of(context).size.width * (30 / 100),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(125),
                      color: Colors.blue[100]!.withOpacity(0.1)),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * (30 / 100),
                right: MediaQuery.of(context).size.width * (-40 / 100),
                child: Container(
                  height: 500,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      color: Colors.blue[100]!.withOpacity(0.1)),
                )),
          ],
        ),
      ),
    );
  }
}
