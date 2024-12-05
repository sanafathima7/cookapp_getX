// data/models/item.dart
import 'package:hive/hive.dart';
import 'package:cookapp/features/shopping_cart/domain/entities/item.dart'
    as domain; // Import domain here

part 'item.g.dart'; // Generated file for Hive

@HiveType(typeId: 1)
class Item {
  @HiveField(0)
  final int id; // Change `int?` to `int` to make it non-nullable
  @HiveField(1)
  final String item;
  @HiveField(2)
  final String name;

  Item({
    required this.id, // Ensure `id` is always provided when creating an instance
    required this.item,
    required this.name,
  });

  // Convert from domain Item
  factory Item.fromDomainItem(domain.Item domainItem) {
    return Item(
      id: domainItem.id ?? 0, // Provide a default value if `id` is null
      item: domainItem.item,
      name: domainItem.name,
    );
  }

  // Convert to domain Item
  domain.Item toDomainItem() {
    return domain.Item(
      id: id,
      name: name,
      item: item,
    );
  }
}
