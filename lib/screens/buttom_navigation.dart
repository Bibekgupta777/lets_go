// import 'package:demo_test/screens/buttom_navigation_bar/about_view.dart';
// import 'package:demo_test/screens/buttom_navigation_bar/contact_us.dart';
// import 'package:demo_test/screens/buttom_navigation_bar/home_view.dart';
// import 'package:demo_test/screens/buttom_navigation_bar/profile_view.dart';
// import 'package:demo_test/screens/buttom_navigation_bar/tickets.dart';
// import 'package:flutter/material.dart';

// class BottomNavigationView extends StatefulWidget {
//   const BottomNavigationView({super.key});

//   @override
//   State<BottomNavigationView> createState() => _BottomNavigationViewState();
// }

// class _BottomNavigationViewState extends State<BottomNavigationView> {
//   int _selectedIndex = 0;

//   List<Widget> lstBottomScreen = [
//     const HomeView(),
//     const ContactUs(),
//     const AboutView(),
//     const ProfileView(),
//     const Tickets(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bottom Navigation View"),
//         centerTitle: true,
//         // backgroundColor: Colors.grey,
//       ),
//       body: lstBottomScreen[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.yellow, // Set the background color to red
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.circle),
//             label: 'About',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
