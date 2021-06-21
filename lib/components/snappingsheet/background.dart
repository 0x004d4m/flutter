import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Container(
      color: Colors.grey[200],
      child: Placeholder(
        color: Colors.green[200]!,
      ),
    );
  }
}
