import 'package:flutter/material.dart';

import '../../extension/gap.dart';
import '../../shared/gaps.dart';

class DetailItem extends StatelessWidget {
  const DetailItem(this.header, this.detail, {super.key});

  final String header;
  final Widget detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          header,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Gaps.small.value.vt,
        detail,
        Gaps.medium.value.vt,
      ],
    );
  }
}
