// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   bool _isEditing = false;

//   @override
//   void initState() {
//     super.initState();
//     // Pre-fill user data (replace with dynamic data if available)
//     _nameController.text = "bibek";
//     _emailController.text = "bibek.kr@example.com";
//     _phoneController.text = "123-456-7890";
//     _addressController.text = "kathmandu-Nepal";
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//         backgroundColor: Colors.green,
//         actions: [
//           // Edit button in app bar
//           IconButton(
//             icon: Icon(_isEditing ? Icons.check : Icons.edit),
//             onPressed: () {
//               setState(() {
//                 _isEditing = !_isEditing;
//               });
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // Profile Picture
//             Center(
//               child: Stack(
//                 clipBehavior: Clip.none, // Allows for floating elements
//                 children: [
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage(
//                         'assets/images/bus4.jpg'), // Replace with dynamic user's profile image
//                   ),
//                   Positioned(
//                     bottom: -10,
//                     right: -10,
//                     child: GestureDetector(
//                       onTap: () {
//                         // Add functionality for changing profile image (e.g. picking a new image)
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content: Text('Change Profile Picture!')),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 20,
//                         backgroundColor: Colors.green,
//                         child: const Icon(
//                           Icons.camera_alt,
//                           color: Colors.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 100),

//             // User Information Fields
//             _buildTextField("Name", _nameController, _isEditing),
//             const SizedBox(height: 36),
//             _buildTextField("Email", _emailController, _isEditing),
//             const SizedBox(height: 36),
//             _buildTextField("Phone Number", _phoneController, _isEditing),
//             const SizedBox(height: 36),
//             _buildTextField("Address", _addressController, _isEditing),
//             const SizedBox(height: 30),

//             // Update Profile Button
//             _isEditing
//                 ? ElevatedButton(
//                     onPressed: () {
//                       // Add functionality to save changes here
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Profile updated!')),
//                       );
//                       setState(() {
//                         _isEditing = false;
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors
//                           .green, // Use backgroundColor instead of primary
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "Save Changes",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 : const SizedBox.shrink(),

//             const SizedBox(height: 30),

//             // Log Out Button
//             ElevatedButton(
//               onPressed: () {
//                 // Log out functionality here
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Logging out...')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor:
//                     Colors.red, // Use backgroundColor instead of primary
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 "Log Out",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // TextField widget for editable user info
//   Widget _buildTextField(
//       String label, TextEditingController controller, bool isEditable) {
//     return TextField(
//       controller: controller,
//       enabled: isEditable,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.black),
//         hintText: label,
//         hintStyle: const TextStyle(color: Colors.grey),
//         filled: true,
//         fillColor: Colors.white,
//         prefixIcon: const Icon(Icons.edit, color: Colors.green),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: Colors.green,
//             width: 1.0,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: Colors.green,
//             width: 1.5,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: Colors.green,
//             width: 1.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:demo_test/features/auth/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = "bibek";
    _emailController.text = "bibek.kr@example.com";
    _phoneController.text = "123-456-7890";
    _addressController.text = "kathmandu-Nepal";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/bus4.jpg'),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Change Profile Picture!'),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            _buildTextField("Name", _nameController, _isEditing),
            const SizedBox(height: 36),
            _buildTextField("Email", _emailController, _isEditing),
            const SizedBox(height: 36),
            _buildTextField("Phone Number", _phoneController, _isEditing),
            const SizedBox(height: 36),
            _buildTextField("Address", _addressController, _isEditing),
            const SizedBox(height: 30),
            _isEditing
                ? ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated!')),
                      );
                      setState(() {
                        _isEditing = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Save Changes",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, bool isEditable) {
    return TextField(
      controller: controller,
      enabled: isEditable,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.edit, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
