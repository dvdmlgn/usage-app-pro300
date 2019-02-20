import 'package:flutter/material.dart';
import 'package:usage/social/social.dart';

class LukesScratchPad extends StatefulWidget {
  @override
  _LukesScratchPadState createState() => _LukesScratchPadState();
}

class _LukesScratchPadState extends State<LukesScratchPad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Social(),
    );
  }
}