import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:petstore/pages/intro_screen.dart';

void main() {
  testWidgets('IntroScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: IntroScreen()));

    // Testing Logo
    expect(find.byType(Lottie), findsOneWidget);

    // Testing texts
    expect(find.text('Unleash Love Adopt a Pet Today!'), findsOneWidget);

    expect(find.text('Furry Friends Await Their Home.'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
