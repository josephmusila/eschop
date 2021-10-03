import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({

    required this.child,
    required this.value,
    required this.color,
  });

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [


           Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            height: 20,
            width: 20,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

      ],
    );
  }
}
