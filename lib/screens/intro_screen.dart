import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_bottom.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBottom(),
      appBar: AppBar(
        title: Text('Globo Fitness'),
      ),
      drawer: MenuDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gym.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
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
