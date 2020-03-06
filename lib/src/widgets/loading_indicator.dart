import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 8),
          child: CircularProgressIndicator(),
        ),
        Text('Loading...'),
      ],
    );
  }
}
