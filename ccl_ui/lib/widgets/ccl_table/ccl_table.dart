import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';

import 'ccl_table_data.dart';

export 'ccl_table_data.dart';

class CCLTable extends StatelessWidget {
  final List<CCLTableRow> rows;
  final Map<int, TableColumnWidth>? columnWidths;
  final TableColumnWidth defaultColumnWidth;
  final TextDirection? textDirection;
  final TableBorder? border;
  final TableCellVerticalAlignment defaultVerticalAlignment;
  final TextBaseline? textBaseline;

  const CCLTable({
    super.key,
    required this.rows,
    this.columnWidths,
    this.defaultColumnWidth = const FlexColumnWidth(),
    this.textDirection,
    this.border,
    this.defaultVerticalAlignment = TableCellVerticalAlignment.top,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
  });

  @override
  Widget build(BuildContext context) {
    var tableRows = rows.map((row) {
      return TableRow(
          decoration: row.decoration,
          children: row.cells.map((cell) {
            return Container(
              padding: row.padding != null && cell.padding != null
                  ? row.padding!.add(cell.padding!)
                  : row.padding ?? cell.padding ?? EdgeInsets.zero,
              decoration: cell.decoration,
              child: cell.text.isNotNullOrEmpty
                  ? Text(
                      cell.text!,
                      textAlign: cell.textAlign,
                      style: cell.style,
                      overflow: cell.textOverflow,
                      maxLines: cell.maxLines,
                    )
                  : cell.child,
            );
          }).toList());
    }).toList();

    return Table(
      children: tableRows,
      columnWidths: columnWidths,
      defaultColumnWidth: defaultColumnWidth,
      textDirection: textDirection ?? Directionality.of(context),
      border: border,
      defaultVerticalAlignment: defaultVerticalAlignment,
      textBaseline: textBaseline,
    );
  }
}
