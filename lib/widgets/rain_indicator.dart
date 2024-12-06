import 'package:flutter/material.dart';

class RainIndicator extends StatelessWidget {
  final bool isRaining;

  const RainIndicator({
    Key? key,
    required this.isRaining,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isRaining ? Colors.blue[100] : Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          isRaining ? 'Il pleut actuellement' : 'Pas de pluie',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}