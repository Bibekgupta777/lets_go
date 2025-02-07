import 'package:demo_test/features/auth/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Form Tests', () {
    testWidgets('Login form has Email and Password fields', (tester) async {
      await tester.pumpWidget(
         MaterialApp(
          home: LoginView(),
        ),
      );

      // Verify the form contains two TextFormFields (Email & Password)
      expect(find.byType(TextFormField), findsNWidgets(2));
    });

    testWidgets('Login button displays validation errors for empty fields',
        (tester) async {
      await tester.pumpWidget(
         MaterialApp(
          home: LoginView(),
        ),
      );

      // Tap the login button without entering any text
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(); // Allow validation to occur

      // Verify validation error messages
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('Login form works with valid input', (tester) async {
      await tester.pumpWidget(
       MaterialApp(
          home: LoginView(),
        ),
      );

      // Enter valid email and password
      await tester.enterText(
          find.byType(TextFormField).at(0), 'nirajan@gmail.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(); // Allow validation to occur

      // Ensure no validation errors are shown
      expect(find.text('Please enter your email'), findsNothing);
      expect(find.text('Please enter your password'), findsNothing);
    });
  });
}
