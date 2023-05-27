import 'package:flutter/material.dart';

import '../core/bloc_state.dart';
import '../view/widgets/loading_indicator.dart';

class ActivityOverlayWidget {
  factory ActivityOverlayWidget.of(BuildContext context) {
    return ActivityOverlayWidget._(context);
  }

  ActivityOverlayWidget._(this._context);

  final BuildContext _context;

  void _hide() {
    Navigator.of(_context).pop();
  }

  void _show() {
    showDialog(
      context: _context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) => const LoadingIndicator(),
    );
  }

  bool loadWhen<State extends BlocState, ExpectedState extends BlocState>(
      State previous, State current) {
    if (current is ExpectedState) {
      ActivityOverlayWidget.of(_context)._show();
    }
    if (previous is ExpectedState) {
      ActivityOverlayWidget.of(_context)._hide();
    }
    return true;
  }
}
