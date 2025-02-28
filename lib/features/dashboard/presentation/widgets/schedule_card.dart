import 'package:demo_test/features/dashboard/domain/entity/schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule schedule;

  const ScheduleCard({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bus Info
            _buildBusInfo(),
            const Divider(height: 24, thickness: 1),
            // Time and Route Info
            _buildTimeAndRouteInfo(),
            const SizedBox(height: 16),
            // Available Seats and Action Button
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBusInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoColumn('Bus ${schedule.bus.busNumber}',
            'Total Seats: ${schedule.bus.totalSeats}'),
        _buildInfoColumn('₹${schedule.fare}', '${schedule.route.distance} km',
            color: Colors.green),
      ],
    );
  }

  Widget _buildTimeAndRouteInfo() {
    return Row(
      children: [
        _buildInfoColumn(
          DateFormat('HH:mm').format(schedule.departureTime),
          schedule.route.source,
        ),
        const Icon(Icons.arrow_forward, color: Colors.grey),
        _buildInfoColumn(
          DateFormat('HH:mm').format(schedule.arrivalTime),
          schedule.route.destination,
          alignment: CrossAxisAlignment.end,
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    final isAvailable = schedule.availableSeats > 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAvailabilityTag(isAvailable),
        ElevatedButton.icon(
          onPressed: isAvailable
              ? () {
                  // Add navigation logic to seat selection
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Navigating to seat selection...')),
                  );
                }
              : null,
          icon: const Icon(Icons.event_seat),
          label: const Text('Select Seats'),
          style: ElevatedButton.styleFrom(
            backgroundColor: isAvailable ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoColumn(String title, String subtitle,
      {Color? color, CrossAxisAlignment alignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildAvailabilityTag(bool isAvailable) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isAvailable
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Available Seats: ${schedule.availableSeats}',
        style: TextStyle(
          color: isAvailable ? Colors.green : Colors.red,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
