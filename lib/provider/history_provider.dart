import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petstore/model/history_model.dart';
import 'package:petstore/model/pet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryProvider extends ChangeNotifier {
  List<HistoryItemModel> _historyList = [];
  List<HistoryItemModel> get historyList => _historyList;

  // Adding the pet to History
  // Also saving the history to shared preferences so that it can be loaded after app restart
  Future<void> addToCart(PetModel pet) async {
    _historyList.add(HistoryItemModel(
      petModel: pet,
    ));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedList =
        json.encode(_historyList.map((item) => item.toMap()).toList());
    await prefs.setString('historyItems', encodedList);

    notifyListeners();
  }

  // Loading the history from shared preferences
  Future<void> loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonList = prefs.getString('historyItems');
    if (jsonList != null) {
      List<dynamic> decodedList = json.decode(jsonList);
      _historyList =
          decodedList.map((item) => HistoryItemModel.fromMap(item)).toList();
    }
    notifyListeners();
  }
}
