import 'package:flutter/material.dart';

class IconBTN extends StatelessWidget {
  const IconBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.grey.shade600,
                  Colors.grey.shade700,
                  Colors.grey.shade800,
                  Colors.grey.shade900,
                ]),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],
          ),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.grey.shade600,
                Colors.grey.shade700,
                Colors.grey.shade800,
                Colors.grey.shade900,
              ],
            ),
          ),
        ),
        Icon(
          Icons.access_time_filled_outlined,
          color: Colors.grey.shade300,
          size: 35,
        ),
      ],
    );
  }
}
