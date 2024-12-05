import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class DraggableController extends GetxController {
  RxMap<String, Offset> itemPositions = <String, Offset>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadPositions();
  }

  Future<void> loadPositions() async {
    try {
      final box = await Hive.openBox('positions');
      box.toMap().forEach((key, value) {
        if (value is Map && value.containsKey('x') && value.containsKey('y')) {
          itemPositions[key] = Offset(value['x'], value['y']);
        }
      });
    } catch (e) {
      print("Error loading positions: $e");
    }
  }

  Future<void> updatePosition(String id, Offset position) async {
    try {
      itemPositions[id] = position;
      final box = await Hive.openBox('positions');
      box.put(id, {'x': position.dx, 'y': position.dy});
    } catch (e) {
      print("Error updating position for $id: $e");
    }
  }

  // New method to handle draggable item initialization or updates
  void handleDraggableItem(String id, {Offset? position}) {
    // If a position is provided, update it; otherwise, use default position
    final newPosition = position ?? Offset(0, 0);

    if (itemPositions.containsKey(id)) {
      // Update existing item's position
      updatePosition(id, newPosition);
    } else {
      // Initialize new item's position
      itemPositions[id] = newPosition;
      updatePosition(id, newPosition);
    }
  }
}
