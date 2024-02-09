import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petstore/model/pet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetProvider extends ChangeNotifier {
  List<PetModel> _pet = [
    PetModel(
        name: "Golden Retriever",
        age: 7,
        price: 999,
        image:
            'https://cdn.shopify.com/s/files/1/1708/4041/files/custom_resized_CG_480x480.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Labrador",
        price: 800,
        age: 10,
        image:
            'https://cdn.shopify.com/s/files/1/1708/4041/files/custom_resized_lab_480x480.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "German Shepherd",
        age: 5,
        price: 999,
        image:
            'https://cdn.shopify.com/s/files/1/1708/4041/files/custom_resized_German_shep_480x480.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Pug",
        age: 7,
        price: 900,
        image:
            'https://cdn.shopify.com/s/files/1/1708/4041/files/custom_resized_pug_480x480.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Dachshund",
        age: 3,
        price: 999,
        image:
            'https://cdn.shopify.com/s/files/1/1708/4041/files/custom_resized_Dasch_480x480.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Doberman",
        age: 8,
        price: 999,
        image:
            'https://cdn.shopify.com/s/files/1/1708/4041/files/custom_resized_Doberman_480x480.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Bombay Cat",
        age: 8,
        price: 999,
        image:
            'https://www.purina.com/_gatsby/image/d27faaa55578077753cd766ba66422ba/db260c3135eaa60932f828cea175db47/Bombay_body_6.jpg?u=https%3A%2F%2Fwww.purina.com%2Fsites%2Fdefault%2Ffiles%2Fmedia%2Fimage%2FBombay_body_6.jpg&a=w%3D500%26h%3D500%26fit%3Dcrop%26crop%3Dentropy%26fm%3Djpg%26q%3D75&cd=c0cce2570df55cb43810291bd1178ad3',
        isAvailable: true,
        category: "cat"),
    PetModel(
        name: "Curl Cat",
        age: 8,
        price: 800,
        image:
            'https://www.purina.com/_gatsby/image/2e1135c6348753b1de00df556dc214be/db260c3135eaa60932f828cea175db47/AmericanCurlSHA_body_6.jpg?u=https%3A%2F%2Fwww.purina.com%2Fsites%2Fdefault%2Ffiles%2Fmedia%2Fimage%2FAmericanCurlSHA_body_6.jpg&a=w%3D500%26h%3D500%26fit%3Dcrop%26crop%3Dentropy%26fm%3Djpg%26q%3D75&cd=3c873b9af078e2b0c2420a82578ced8a',
        isAvailable: true,
        category: "cat"),
    PetModel(
        name: "Bengal Cat",
        age: 8,
        price: 850,
        image:
            'https://www.purina.com/_gatsby/image/8ffc824a9ab9ea7c57f016709e730aed/db260c3135eaa60932f828cea175db47/Bengal_body_6.jpg?u=https%3A%2F%2Fwww.purina.com%2Fsites%2Fdefault%2Ffiles%2Fmedia%2Fimage%2FBengal_body_6.jpg&a=w%3D500%26h%3D500%26fit%3Dcrop%26crop%3Dentropy%26fm%3Djpg%26q%3D75&cd=c72db56a4aadc1ed3135e61fe44a039f',
        isAvailable: true,
        category: "cat"),
    PetModel(
        name: "Chartreux",
        age: 8,
        price: 999,
        image:
            'https://www.purina.com/_gatsby/image/95d40c1d26970f3fd4eece5caa86469b/db260c3135eaa60932f828cea175db47/Chartruese_body_6.jpg?u=https%3A%2F%2Fwww.purina.com%2Fsites%2Fdefault%2Ffiles%2Fmedia%2Fimage%2FChartruese_body_6.jpg&a=w%3D500%26h%3D500%26fit%3Dcrop%26crop%3Dentropy%26fm%3Djpg%26q%3D75&cd=4b6c3ab2c162c0135ec851581ceb4a16',
        isAvailable: true,
        category: "cat"),
  ];

  List<PetModel> get pet => _pet;

  Future<void> buyItem(PetModel product) async {
    final PetModel item =
        _pet.firstWhere((element) => element.id == product.id);
    item.isAvailable = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedList = json.encode(_pet.map((item) => item.toMap()).toList());
    await prefs.setString('petList', encodedList);
    notifyListeners();
  }

  // Loading the history from shared preferences
  Future<void> loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonList = prefs.getString('petList');
    if (jsonList != null) {
      List<dynamic> decodedList = json.decode(jsonList);
      _pet = decodedList.map((item) => PetModel.fromMap(item)).toList();
    }
    notifyListeners();
  }
}
