import 'package:demo_test/features/auth/presentation/view/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RegistrationView should display input fields and register button', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegistrationView(),
      ),
    );

    // Verify presence of input fields and Sign Up button
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3)); // Name, Email, Password fields
  });

  testWidgets('Show error if Sign Up is pressed with empty fields', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegistrationView(),
      ),
    );

    await tester.tap(find.text('Sign Up'));
    await tester.pump();

    // Verify error messages appear
    expect(find.text('Please enter your full name'), findsOneWidget);
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Allow user to enter name, email, and password', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegistrationView(),
      ),
    );

    // Enter text into the input fields
    await tester.enterText(find.byType(TextFormField).at(0), 'Nirajan Mahato');
    await tester.enterText(find.byType(TextFormField).at(1), 'nirajan@gmail.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');

    // Verify that the entered text appears
    expect(find.text('Nirajan Mahato'), findsOneWidget);
    expect(find.text('nirajan@gmail.com'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);
  });
}