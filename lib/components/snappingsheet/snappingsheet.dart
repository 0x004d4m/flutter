import 'dart:async';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:splashtest/components/pincode/generatePIN.dart';
import 'package:splashtest/components/pincode/pincode.dart';
import 'package:splashtest/components/snappingsheet/grabbingwidget.dart';

final ScrollController listViewController = new ScrollController();
String pin = generateRandomInt();

Widget simpleSnappingSheet() {
  print(pin);
  final snappingSheetController = SnappingSheetController();
  return SnappingSheet(
    controller: snappingSheetController,
    child: PinCodePage(storedPasscode: pin),
    lockOverflowDrag: true,
    snappingPositions: [
      SnappingPosition.factor(
        positionFactor: 0.0,
        snappingCurve: Curves.easeOutExpo,
        snappingDuration: Duration(seconds: 1),
        grabbingContentOffset: GrabbingContentOffset.top,
      ),
      SnappingPosition.factor(
        snappingCurve: Curves.elasticOut,
        snappingDuration: Duration(milliseconds: 1750),
        positionFactor: 0.5,
      ),
      SnappingPosition.factor(
        grabbingContentOffset: GrabbingContentOffset.bottom,
        snappingCurve: Curves.easeInExpo,
        snappingDuration: Duration(seconds: 1),
        positionFactor: 0.9,
      ),
    ],
    grabbing: GrabbingWidget(),
    grabbingHeight: 75,
    sheetBelow: SnappingSheetContent(
      draggable: true,
      childScrollController: listViewController,
      child: Scaffold(
        body: Center(child: Text('This Is Your PIN Code: ' + pin)),
      ),
    ),
    onSnapCompleted: (x, y) {
      Timer(Duration(seconds: 3), () {
        snappingSheetController.snapToPosition(
          SnappingPosition.factor(positionFactor: 0.05),
        );
      });
    },
  );
}
