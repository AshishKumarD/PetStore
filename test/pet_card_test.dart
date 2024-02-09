import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petstore/components/pet_card.dart';
import 'package:petstore/model/pet_model.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Product component displays correctly',
      (WidgetTester tester) async {
    // Mock network image loading
    mockNetworkImagesFor(() async {
      // Create a PetModel instance for testing
      final PetModel testPet = PetModel(
        name: 'Fluffy',
        age: 2,
        price: 100.0,
        image:
            'https://example.com/image.jpg', // Use a mock image URL for testing
        category: 'Cat',
        isAvailable: true,
      );

      // Build the Product widget with the testPet instance
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(product: testPet),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Testing if components matches model information
      expect(find.text(testPet.name), findsOneWidget);

      // Verify that the availability status is displayed correctly
      expect(find.text('Available'), findsOneWidget);

      // Verify that the widget tree matches the expected layout
      expect(find.byType(Stack), findsNWidgets(2));
      expect(find.byType(Text), findsNWidgets(2)); // Expecting two Text widgets
      expect(find.byType(CircleAvatar), findsOneWidget);
    });
  });
}
