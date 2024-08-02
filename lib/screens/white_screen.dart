import 'package:flutter/material.dart';

class WhiteScreen extends StatelessWidget {
  final String title;

  const WhiteScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
