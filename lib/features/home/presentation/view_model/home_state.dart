import 'package:demo_test/features/home/presentation/view/bottom_view/about_us_view.dart';
import 'package:demo_test/features/home/presentation/view/bottom_view/home_view.dart';
import 'package:demo_test/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return const HomeState(
      selectedIndex: 0,
      views: [
        HomeView(),
        Center(
          child: Text('Tickets'),
        ),
        AboutUsPage(),
        ProfilePage(),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
