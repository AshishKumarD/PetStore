import 'package:petstore/model/pet_model.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class HistoryItemModel {
  final String id;
  final PetModel petModel;

  HistoryItemModel({
    required this.petModel,
  }) : id = uuid.v4();

  // Convert HistoryItemModel to Map
  Map<String, dynamic> toMap() {
    return {
      'petModel': petModel.toMap(),
    };
  }

  // Create HistoryItemModel from Map
  factory HistoryItemModel.fromMap(Map<String, dynamic> map) {
    return HistoryItemModel(
      petModel: PetModel.fromMap(map['petModel']),
    );
  }
}
