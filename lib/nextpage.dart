import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(child: Text('This is Next Page')),
    );
  }
}