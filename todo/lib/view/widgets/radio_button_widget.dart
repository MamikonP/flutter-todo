import 'package:flutter/material.dart';

import '../../extension/gap.dart';
import '../../shared/gaps.dart';
import '../screens/home/constants/filter_by.dart';

class RadioButtonWidget<T extends FilterBy> extends StatefulWidget {
  const RadioButtonWidget(this.items, {this.onSaved, super.key});

  final List<T> items;
  final void Function(T?)? onSaved;

  @override
  State<RadioButtonWidget<T>> createState() => _RadioButtonWidgetState<T>();
}

class _RadioButtonWidgetState<T extends FilterBy>
    extends State<RadioButtonWidget<T>> {
  T? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Gaps.small.value.vt,
        const Text(
          'Filter By',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.all(Gaps.small.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widget.items
                .map((T filterBy) => Row(
                      children: <Widget>[
                        Expanded(child: Text(filterBy.name)),
                        Radio<T>.adaptive(
                          value: filterBy,
                          groupValue: selected,
                          onChanged: (T? value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
        TextButton(
          onPressed: () => widget.onSaved?.call(selected),
          child: const Text('Save',
              style: TextStyle(
                color: Colors.green,
              )),
        ),
      ],
    );
  }
}
