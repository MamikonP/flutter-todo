import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showPopup(
  BuildContext context,
  Widget builder, {
  bool dismissible = true,
  bool scrollable = false,
  bool enableDrag = false,
  bool materialWidget = false,
  EdgeInsets padding = EdgeInsets.zero,
  BorderRadius? borderRadius,
  double? height,
}) async {
  await showModalBottomSheet(
    context: context,
    isDismissible: dismissible,
    enableDrag: true,
    isScrollControlled: scrollable,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ??
          const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
    ),
    builder: (_) {
      return Container(
        height: height,
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(child: builder),
          ],
        ),
      );
    },
  );
}
