import 'package:flutter/material.dart';

class DetailRow {
  static Widget buildDataRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  static Widget buildSeparator() {
    return Container(
      height: 1,
      color: Colors.grey,
      margin: EdgeInsets.symmetric(vertical: 8),
    );
  }
}