class ConsumptionEntity {
  final int? id;
  final String name;
  final String unit;
  final int color;
  final int userId;

  ConsumptionEntity({
    this.id,
    required this.name,
    required this.unit,
    required this.color,
    required this.userId,
  });
}
