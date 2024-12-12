// // import 'package:demo_test/screens/home_screen.dart';
// import 'package:demo_test/screens/login_screen.dart';
// import 'package:flutter/material.dart';

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   // Variables to track if the text fields are empty
//   bool isFullNameEmpty = false;
//   bool isPhoneNumberEmpty = false;
//   bool isEmailEmpty = false;
//   bool isPasswordEmpty = false;
//   bool isConfirmPasswordEmpty = false;

//   // Method for registration
//   void _register() {
//     String fullName = fullNameController.text;
//     String phoneNumber = phoneNumberController.text;
//     String email = emailController.text;
//     String password = passwordController.text;
//     String confirmPassword = confirmPasswordController.text;

//     setState(() {
//       isFullNameEmpty = fullName.isEmpty;
//       isPhoneNumberEmpty = phoneNumber.isEmpty;
//       isEmailEmpty = email.isEmpty;
//       isPasswordEmpty = password.isEmpty;
//       isConfirmPasswordEmpty = confirmPassword.isEmpty;
//     });

//     if (!isFullNameEmpty &&
//         !isPhoneNumberEmpty &&
//         !isEmailEmpty &&
//         !isPasswordEmpty &&
//         !isConfirmPasswordEmpty) {
//       if (password == confirmPassword) {
//         // Registration success, show message and navigate to login screen
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Registration Successful')),
//         );

//         // After successful registration, navigate to LoginScreen
//         Future.delayed(Duration(seconds: 1), () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => LoginScreen()),
//           );
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Passwords do not match')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all fields')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.lightBlueAccent, Colors.red],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Column(
//             children: [
//               // Top Section
//               Flexible(
//                 flex: 3,
//                 fit: FlexFit.tight,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Logo
//                     Image.asset(
//                       'assets/logo.png',
//                       height: 150,
//                     ),
//                     SizedBox(height: 50),

//                     // Sign Up Text
//                     Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         fontSize: 35,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Middle Section
//               Flexible(
//                 flex: 6,
//                 fit: FlexFit.tight,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Full Name TextField
//                       TextField(
//                         controller: fullNameController,
//                         decoration: InputDecoration(
//                           labelText: 'Full Name',
//                           labelStyle: TextStyle(color: Colors.white),
//                           filled: true,
//                           fillColor: isFullNameEmpty
//                               ? Colors.red.withOpacity(0.3)
//                               : Colors.white.withOpacity(0.1),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(height: 20),

//                       // Phone Number TextField
//                       TextField(
//                         controller: phoneNumberController,
//                         decoration: InputDecoration(
//                           labelText: 'Phone Number',
//                           labelStyle: TextStyle(color: Colors.white),
//                           filled: true,
//                           fillColor: isPhoneNumberEmpty
//                               ? Colors.red.withOpacity(0.3)
//                               : Colors.white.withOpacity(0.1),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(height: 20),

//                       // Email TextField
//                       TextField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           labelStyle: TextStyle(color: Colors.white),
//                           filled: true,
//                           fillColor: isEmailEmpty
//                               ? Colors.red.withOpacity(0.3)
//                               : Colors.white.withOpacity(0.1),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(height: 20),

//                       // Password TextField
//                       TextField(
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           labelStyle: TextStyle(color: Colors.white),
//                           filled: true,
//                           fillColor: isPasswordEmpty
//                               ? Colors.red.withOpacity(0.3)
//                               : Colors.white.withOpacity(0.1),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(height: 20),

//                       // Confirm Password TextField
//                       TextField(
//                         controller: confirmPasswordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Confirm Password',
//                           labelStyle: TextStyle(color: Colors.white),
//                           filled: true,
//                           fillColor: isConfirmPasswordEmpty
//                               ? Colors.red.withOpacity(0.3)
//                               : Colors.white.withOpacity(0.1),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(height: 30),

//                       // Sign Up Button
//                       ElevatedButton(
//                         onPressed: _register,
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 50, vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),

//                       // Already have an account Text
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Already have an account? ",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => LoginScreen()),
//                               );
//                             },
//                             child: Text(
//                               "Login",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import LoginScreen

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Method for registration
  void _register() {
    String fullName = fullNameController.text;
    String phoneNumber = phoneNumberController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (fullName.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Successful')),
        );

        // Navigate to LoginScreen
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              // Top Section
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/logo.png',
                      height: 120,
                    ),
                    SizedBox(height: 50),

                    // Sign Up Text
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Middle Section
              Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Full Name TextField
                      TextField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),

                      // Phone Number TextField
                      TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),

                      // Email TextField
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),

                      // Password TextField
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),

                      // Confirm Password TextField
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30),

                      // Sign Up Button
                      ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      // Already have an account Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
