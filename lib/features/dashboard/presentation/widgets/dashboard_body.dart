import 'package:demo_test/features/dashboard/presentation/view_model/dashboard_bloc.dart';
import 'package:demo_test/features/dashboard/presentation/view_model/dashboard_event.dart';
import 'package:demo_test/features/dashboard/presentation/view_model/dashboard_state.dart';
import 'package:demo_test/features/dashboard/presentation/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _sourceController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildWelcomeMessage(),
              const SizedBox(height: 30),
              _buildSearchSection(),
              const SizedBox(height: 30),
              _buildSchedulesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      "Let's Go",
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Text(
      'Welcome! Find and book your bus tickets easily.',
      style: TextStyle(
        fontSize: 18,
        color: Colors.grey[700],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSearchSection() {
    return Card(
      color: Colors.blue[50],
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _sourceController,
              decoration: InputDecoration(
                labelText: 'From',
                prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'To',
                prefixIcon:
                    Icon(Icons.location_on_outlined, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Journey Date',
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  DateFormat('dd/MM/yyyy').format(_selectedDate),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _searchSchedules,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Search Buses',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchedulesList() {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DashboardLoaded) {
          if (state.schedules.isEmpty) {
            return Center(
              child: Text(
                'No schedules available for selected route and date',
                style: TextStyle(fontSize: 16, color: Colors.redAccent),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.schedules.length,
            itemBuilder: (context, index) {
              return ScheduleCard(schedule: state.schedules[index]);
            },
          );
        } else if (state is DashboardError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          );
        }
        return Center(
          child: Text(
            'Search for available buses',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _searchSchedules() {
    if (_sourceController.text.isNotEmpty &&
        _destinationController.text.isNotEmpty) {
      context.read<DashboardBloc>().add(
            SearchSchedulesEvent(
              source: _sourceController.text,
              destination: _destinationController.text,
              date: _selectedDate,
            ),
          );
    }
  }
}
