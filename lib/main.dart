import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splashtest/components/snappingsheet/snappingsheet.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

///
class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => simpleSnappingSheet()));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF3366FF),
                const Color(0xFF00CCFF),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: InkWell(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.network(
                          "http://3.124.190.213/static/svg/pirate.svg",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
