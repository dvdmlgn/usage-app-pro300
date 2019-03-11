import 'package:flutter/material.dart';
import 'package:usage/components/shared/fab.dart';

enum sections { inventory, shopping, social }

class View {
  Widget leadingAction;
  Widget body;
  Fab fab;
  sections section;
  String meta;

  View({this.leadingAction, this.body, this.fab, this.section, this.meta});
}
