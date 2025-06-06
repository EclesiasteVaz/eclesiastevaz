
import 'package:flutter/material.dart';

class CustomWrapWidget extends StatefulWidget {
  final List<Widget> children;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final bool isRow;

  const CustomWrapWidget({
    super.key,
    required this.children,
    this.spacing = 0,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.isRow = true,
  });

  @override
  State<CustomWrapWidget> createState() => _CustomWrapWidgetState();
}

class _CustomWrapWidgetState extends State<CustomWrapWidget> {
  late ValueNotifier<bool> isRow;
  final _key = GlobalKey<_CustomWrapWidgetState>();
  @override
  void initState() {
    super.initState();
    isRow = ValueNotifier(widget.isRow);
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      isRow.value = MediaQuery.sizeOf(context).width > 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      key: _key,
      valueListenable: isRow,
      builder: (_, value, __) {
        if (widget.isRow) {
          return Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            crossAxisAlignment: widget.crossAxisAlignment,
            spacing: widget.spacing,
            mainAxisSize: widget.mainAxisSize,
            children: widget.children,
          );
        }
        return Column(
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          spacing: widget.spacing,
          mainAxisSize: widget.mainAxisSize,
          children: widget.children,
        );
      },
    );
  }
}
