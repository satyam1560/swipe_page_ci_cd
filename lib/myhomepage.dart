import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _currentColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SWIPE'),
      ),
      body: Swipe(
        onSwipeUp: () {
          print('swipe up triggered');
          setState(() {
            _currentColor = Colors.black;
          });
        },
        onSwipeDown: () {
          print('swipe down triggered');
          setState(() {
            _currentColor = Colors.blue;
          });
        },
     
        child: Container(
          color: _currentColor,
        ),
      ),
    );
  }
}
