import 'package:flutter/material.dart';

extension GapExtension on double {
  SizedBox get vt => SizedBox(height: this);
  SizedBox get ht => SizedBox(width: this);
}
