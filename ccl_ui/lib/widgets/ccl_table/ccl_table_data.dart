import 'package:flutter/material.dart';

class CCLTableRow {
  final Decoration? decoration;
  final List<CCLTableCell> cells;
  final EdgeInsetsGeometry? padding;

  CCLTableRow({required this.cells, this.decoration, this.padding});
}

class CCLTableCell {
  final String? text;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final Widget? child;

  CCLTableCell(
      {this.text,
      this.textAlign,
      this.style,
      this.maxLines,
      this.textOverflow,
      this.padding,
      this.decoration,
      this.child})
      : assert(text == null || child == null,
            'Only text or child should provided.'),
        assert(text != null || child != null,
            'Ether text or child should provided');
}
