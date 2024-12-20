import 'dart:async';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  int _currentPage = 0;

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Timer to auto-swipe the images every 2 seconds
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0; // Go back to the first page
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const Text(
              "Hello ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Book your bus tickets easily and quickly!",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            // Swiping Photo Carousel
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageController,
                children: [
                  _carouselImage('assets/images/download.jpg'),
                  _carouselImage('assets/images/download (1).jpg'),
                  _carouselImage('assets/images/download (2).jpg'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Location, Date, Time Inputs, and Search Button
            _sectionTitle("From"),
            _customTextField(
              "Enter starting location",
              icon: Icons.location_on,
            ),
            const SizedBox(height: 10),
            _sectionTitle("To"),
            _customTextField(
              "Enter destination",
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 10),
            _sectionTitle("Date"),
            _customTextField(
              _selectedDate == null
                  ? "Select date"
                  : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
              icon: Icons.calendar_today,
              onTap: _pickDate,
            ),
            const SizedBox(height: 10),
            _sectionTitle("Time"),
            _customTextField(
              _selectedTime == null
                  ? "Select time"
                  : _selectedTime!.format(context),
              icon: Icons.access_time,
              onTap: _pickTime,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Add search functionality
                },
                child: const Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Footer Section
            const Divider(),
            const Center(
              child: Text(
                "© 2024 Bus Booking System",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _carouselImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _customTextField(String hintText,
      {IconData? icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white24,
            prefixIcon: icon != null ? Icon(icon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
      ),
    );
  }
}
