import '../../domain/entities/consumption_entity.dart';

extension ConsumptionDto on ConsumptionEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'unit': unit,
      'color': color,
    };
  }

  static ConsumptionEntity fromMap(Map<String, dynamic> map) {
    return ConsumptionEntity(
      id: map['id'],
      name: map['name'],
      unit: map['unit'],
      color: map['color'],
    );
  }
}
