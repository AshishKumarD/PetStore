import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class PetModel {
  final String id;
  final String name;
  final int age;
  final double price;
  final String image;
  final String category;
  bool isAvailable;

  PetModel({
    required this.name,
    required this.age,
    required this.price,
    required this.image,
    required this.isAvailable,
    this.category = "",
  }) : id = uuid.v4();

  // Convert PetModel to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'price': price,
      'image': image,
      'category': category,
      'isAvailable': isAvailable,
    };
  }

  // Create PetModel from Map
  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      name: map['name'],
      age: map['age'],
      price: map['price'],
      image: map['image'],
      category: map['category'] ?? "",
      isAvailable: map['isAvailable'],
    );
  }
}
