import 'package:flutter/material.dart';

class SecondUiView extends StatefulWidget {
  const SecondUiView({super.key});

  @override
  State<SecondUiView> createState() => _DragDropGameState();
}

class _DragDropGameState extends State<SecondUiView> {
  final List<Color> ballColors = [Colors.red, Colors.green, Colors.blue];

  final Map<Color, bool> matched = {
    Colors.red: false,
    Colors.green: false,
    Colors.blue: false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Physics Playground"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ballColors.map((color) {
              return Draggable<Color>(
                data: color,
                feedback: Ball(
                  color: color.withAlpha(180),
                  radius: 30,
                ),
                childWhenDragging: Ball(
                  color: color.withAlpha(80),
                ),
                child: Ball(color: color),
              );
            }).toList(),
          ),

          // 🟥 الحاويات
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ballColors.map((color) {
              return DragTarget<Color>(
                onWillAcceptWithDetails: (incoming) => true,
                onAcceptWithDetails: (incoming) {
                  setState(() {
                    if (incoming.data == color) {
                      matched[color] = true;
                    }
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: matched[color]!
                          ? color // ✅ تطابق
                          : candidateData.isNotEmpty
                          ? Colors.grey.shade300
                          : color.withAlpha(80),
                      border: Border.all(color: color, width: 3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: matched[color]!
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 32,
                            )
                          : const SizedBox.shrink(),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String colorName(Color c) {
    if (c == Colors.red) return "Red";
    if (c == Colors.green) return "Green";
    if (c == Colors.blue) return "Blue";
    return "Color";
  }
}

class Ball extends StatelessWidget {
  final Color color;
  final double radius;

  const Ball({
    super.key,
    required this.color,
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withAlpha(150),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
