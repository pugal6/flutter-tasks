// green_box.dart
import 'package:flutter/material.dart';

class GreenBox extends LeafRenderObjectWidget {
  const GreenBox({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderGreenBox();
  }
}

class _RenderGreenBox extends RenderBox {
  @override
  void performLayout() {
    size = constraints.constrain(const Size(120, 120));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final paint = Paint()..color = const Color(0xFF4CAF50);

    context.canvas.drawRect(offset & size, paint);
  }
}