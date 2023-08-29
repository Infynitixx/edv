import 'package:flutter/material.dart';


class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final double titleSize;
  final double subtitleSize;
  final VoidCallback onTap;

  const ListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.titleSize,
    required this.subtitleSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
                  TextStyle(color: Colors.white, fontSize: titleSize),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child:
                  Text(subtitle, style:
                  TextStyle(color: Colors.white, fontSize: subtitleSize),
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