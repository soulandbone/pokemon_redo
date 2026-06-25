import 'package:flutter/material.dart';

class LabelValue extends StatelessWidget {
  const LabelValue({
    required this.textLabel,
    required this.icon,
    required this.value,
    super.key,
  });

  final String textLabel;
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18),
              SizedBox(width: 4),
              Text(textLabel),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
