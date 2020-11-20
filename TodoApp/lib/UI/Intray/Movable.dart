import 'package:flutter/material.dart';
import 'package:TodoApp/models/global.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';

class MoveableStackItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoveableStackItemState();
  }
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  double yPosition = 300;
  double xPosition = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGreyColor,
      child: Stack(
        children: [
          Positioned(
            top: yPosition,
            left: xPosition,
            child: GestureDetector(
              onPanUpdate: (tapInfo) {
                setState(() {
                  yPosition += tapInfo.delta.dy;
                  xPosition += tapInfo.delta.dx;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                child: WhiteKing(size: 100,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
