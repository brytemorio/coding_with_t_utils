import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../loaders/animation_loader.dart';

/// Enhanced TPaginatedDataTable Widget
/// A flexible widget for displaying paginated data tables with customization options.
class TPaginatedDataTable extends StatelessWidget {
  const TPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = 760,
    this.onPageChanged,
    this.sortColumnIndex,
    this.dataRowHeight,
    this.sortAscending = true,
    this.minWidth = 1000,
    this.header,
    this.actions = const [],
    this.emptyWidget,
  });

  /// Whether to sort the DataTable in ascending or descending order.
  final bool sortAscending;

  /// Index of the column to sort by.
  final int? sortColumnIndex;

  /// Number of rows to display per page.
  final int rowsPerPage;

  /// Data source for the DataTable.
  final DataTableSource source;

  /// List of columns for the DataTable.
  final List<DataColumn> columns;

  /// Callback function to handle page changes.
  final Function(int)? onPageChanged;

  /// Height of each data row in the DataTable.
  final double? dataRowHeight;

  /// Height of the entire DataTable.
  final double tableHeight;

  /// Minimum Width of the entire DataTable.
  final double? minWidth;

  /// Header widget on top of DataTable.
  final Widget? header;

  /// Custom actions (e.g., buttons, dropdowns) for the table header.
  final List<Widget> actions;

  /// Custom widget to display when no data is available.
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(cardTheme: const CardThemeData(color: Colors.white, elevation: 0)),
        child: PaginatedDataTable2(
          source: source,

          /// COLUMNS & ROWS
          columns: columns,
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          rowsPerPage: rowsPerPage,
          dataRowHeight: dataRowHeight ?? TSizes().xl * 2,

          /// CHECKBOX
          showCheckboxColumn: true,

          /// PAGINATION
          showFirstLastButtons: true,
          onPageChanged: onPageChanged,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (noOfRows) {},
          checkboxAlignment: Alignment.centerLeft,
          header: header != null || actions.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (header != null) Expanded(child: header!),
                    Row(children: actions),
                  ],
                )
              : null,
          availableRowsPerPage: [rowsPerPage, rowsPerPage * 2, rowsPerPage * 5, rowsPerPage * 10],

          /// HEADER DESIGN
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith((states) => TColors().lightBackground),
          headingRowDecoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes().borderRadiusMd),
              topRight: Radius.circular(TSizes().borderRadiusMd),
            ),
          ),

          /// EMPTY STATE
          empty: emptyWidget ??
              const TAnimationLoader(
                animation: 'assets/images/animations/table.gif',
                message: Text('Nothing Found'),
                height: 200,
                width: 200,
              ),

          /// SORTING
          sortAscending: sortAscending,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (bool ascending, bool sorted) {
            if (sorted) {
              return Icon(ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down, size: TSizes().iconSm);
            } else {
              return Icon(Iconsax.arrow_swap, size: TSizes().iconSm);
            }
          },
        ),
      ),
    );
  }
}
