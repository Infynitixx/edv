import 'package:flutter/material.dart';


class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.all(8),
      color: Color(0xFF424242),
      child: InkWell(
        onTap: onTap,
        child: Padding(
            padding: EdgeInsets.all(16),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child:
                  Text(title, style:
                  TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child:
                  Text(subtitle, style:
                  TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}