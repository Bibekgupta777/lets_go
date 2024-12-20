import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Buses'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Search for buses here!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
