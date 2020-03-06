import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorMessage;

  ErrorIndicator({
    @required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 8),
          child: Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
        ),
        Text(errorMessage),
      ],
    );
  }
}
