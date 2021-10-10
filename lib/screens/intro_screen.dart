import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Globo Fitness'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gym.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text(
              'Commit to be fit, dare to be great \nwith Globo Fitness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.blueGrey,
                shadows: [
                  Shadow(
                      offset: Offset(0.5, 0.5),
                      blurRadius: 2.0,
                      color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
