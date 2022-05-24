import '../../domain/entities/selected_consumption_entity.dart';

extension SelectedConsumptionDto on SelectedConsumptionEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static SelectedConsumptionEntity fromMap(Map<String, dynamic> map) {
    return SelectedConsumptionEntity(
      id: map['id'],
      name: map['name'],
    );
  }
}
