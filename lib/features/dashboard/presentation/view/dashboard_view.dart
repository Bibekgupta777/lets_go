import 'package:demo_test/features/dashboard/presentation/widgets/dashboard_body.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Your Bus'),
      ),
      body: DashboardBody(),
    );
  }
}