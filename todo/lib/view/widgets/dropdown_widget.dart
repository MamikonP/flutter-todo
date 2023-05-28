import 'package:flutter/material.dart';

class DropDownWidget<T> extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.items,
    this.prefix,
    this.selectedText,
    this.onChanged,
    this.onSelected,
    this.border,
    this.child,
    this.enabled = true,
  });

  final Widget? prefix;
  final String? selectedText;
  final List<T> items;
  final void Function(T)? onSelected;
  final ValueChanged<String>? onChanged;
  final InputBorder? border;
  final Widget? child;
  final bool enabled;

  @override
  State<DropDownWidget<T>> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.selectedText != null) {
      _controller.text = widget.selectedText!;
    }

    _controller.addListener(() {
      final void Function(String)? onChanged = widget.onChanged;

      if (onChanged != null) {
        onChanged(_controller.text);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DropDownWidget<T> oldWidget) {
    if (widget.selectedText != null) {
      _controller.text = widget.selectedText!;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: widget.onChanged,
        readOnly: true,
        controller: _controller,
        decoration: InputDecoration(
          border: widget.border,
          prefix: widget.prefix,
          suffixIcon: PopupMenuButton<T>(
            enabled: widget.enabled,
            icon:
                widget.child == null ? const Icon(Icons.arrow_drop_down) : null,
            child: widget.child,
            onSelected: (T value) {
              _controller.text = value.toString();
              widget.onSelected?.call(value);
            },
            itemBuilder: (BuildContext context) {
              return widget.items.map<PopupMenuItem<T>>((T value) {
                return PopupMenuItem<T>(
                    value: value,
                    child: Text(value.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        )));
              }).toList();
            },
          ),
        ),
      );
}
