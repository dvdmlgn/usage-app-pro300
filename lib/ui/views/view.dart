import 'package:flutter/material.dart';
import 'package:usage/ui/components/fab.dart';

enum sections { inventory, shopping, social }

class View {
  sections section;
  Widget body;
  Widget leadingAction;
  Fab fab;
  String meta;
  View({this.leadingAction, this.body, this.fab, this.section, this.meta});
}
