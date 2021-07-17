import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key}) : super(key: key);

  //TODO - implementar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Oops!..'),
      ),
    );
  }
}
