import 'package:flutter/material.dart';
import 'package:usage/social/social.dart';

class GarysScratchPad extends StatefulWidget {
  @override
  _GarysScratchPadState createState() => _GarysScratchPadState();
}

class _GarysScratchPadState extends State<GarysScratchPad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Social(),
    );
  }
}
