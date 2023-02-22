/* import 'package:flutter/material.dart';
import 'appscreen/home_page.dart';
import 'appscreen/eatraidee_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/eat': (context) => const EatPage(),
        '/calculate': (context) => const CalculatePage(),
      },
    );
  }
}

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'หารค่าอาหาร',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
 */

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Food Spinner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomFoodSpinner(),
    );
  }
}

class RandomFoodSpinner extends StatefulWidget {
  @override
  _RandomFoodSpinnerState createState() => _RandomFoodSpinnerState();
}

class _RandomFoodSpinnerState extends State<RandomFoodSpinner> {
  TextEditingController _textController = TextEditingController();
  List<String> _foodOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a food option',
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _foodOptions.add(value);
                    _textController.clear();
                  });
                }
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _foodOptions.length >= 2
                  ? SpinningWheel(
                      Image.asset('assets/images/wheel-6-300.png'),
                      width: 300,
                      height: 300,
                      initialSpinAngle: _generateRandomAngle(),
                      spinResistance: 0.2,
                      canInteractWhileSpinning: false,
                      dividers: _foodOptions.length,
                      onUpdate: _dividerController.add,
                      onEnd: _onEnd,
                      secondaryImage:
                          Image.asset('assets/images/roulette-center-300.png'),
                      secondaryImageHeight: 110,
                      secondaryImageWidth: 110,
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  void _onEnd(int selected) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Random Food Picker'),
        content: Text(_foodOptions[selected]),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  double _generateRandomAngle() {
    int randomIndex = Random().nextInt(_foodOptions.length);
    return (randomIndex * (360 / _foodOptions.length)) * (pi / 180);
  }

  final StreamController<double> _dividerController =
      StreamController<double>.broadcast();
}
