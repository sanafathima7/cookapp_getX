import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cookapp/controllers/Draggable_controller.dart';

class DraggableItem extends StatelessWidget {
  final String id;
  final Offset initialPosition;

  DraggableItem({required this.id, required this.initialPosition});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DraggableController>(
      builder: (controller) {
        return Positioned(
          left: initialPosition.dx,
          top: initialPosition.dy,
          child: Draggable<String>(
            data: id,
            onDragEnd: (details) {
              // Update the position when drag ends
              controller.updatePosition(id, details.offset);
            },
            feedback: Material(
              color: Colors.transparent,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red, // Feedback UI
              ),
            ),
            childWhenDragging: Container(), // Empty when dragging
            child: GestureDetector(
              onTap: () {
                // Handle on tap if needed
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue, // Draggable item color
              ),
            ),
          ),
        );
      },
    );
  }
}
