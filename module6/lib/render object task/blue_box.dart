// blue_box.dart
import 'package:flutter/material.dart';

class BlueBox extends LeafRenderObjectWidget {
  const BlueBox({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderBlueBox();
  }
}

class _RenderBlueBox extends RenderBox {
  @override
  void performLayout() {
    size = constraints.constrain(const Size(120, 120));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final paint = Paint()..color = const Color(0xFF2196F3);

    context.canvas.drawRect(offset & size, paint);
  }
}