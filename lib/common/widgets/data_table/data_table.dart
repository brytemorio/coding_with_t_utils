import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../containers/custom_container.dart';
import '../loaders/animation_loader.dart';

/// Enhanced TDataTable Widget
/// A flexible widget for displaying data tables with customization options.
class TDataTable extends StatelessWidget {
  const TDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.tableHeight,
    this.sortColumnIndex,
    this.dataRowHeight = 64,
    this.sortAscending = true,
    this.isLoading = false,
    this.minWidth = 1000,
    this.header,
    this.loadMoreButtonOnPressed,
    this.allItemsFetched = false,
    this.hideFooter = false,
    this.hideLoadMore = false,
    this.actions = const [],
    this.emptyWidget,
  });

  /// Whether to sort the DataTable in ascending or descending order.
  final bool isLoading;

  /// Whether to sort the DataTable in ascending or descending order.
  final bool sortAscending;

  /// Index of the column to sort by.
  final int? sortColumnIndex;

  /// Data source for the DataTable.
  final List<DataRow> rows;

  /// List of columns for the DataTable.
  final List<DataColumn> columns;

  /// Height of each data row in the DataTable.
  final double dataRowHeight;

  /// Height of the entire DataTable.
  final double? tableHeight;

  /// Minimum Width of the entire DataTable.
  final double? minWidth;

  /// Header widget on top of DataTable.
  final Widget? header;

  /// Custom actions (e.g., buttons, dropdowns) for the table header.
  final List<Widget> actions;

  /// LoadMore button DataTable.
  final bool allItemsFetched, hideFooter, hideLoadMore;

  /// LoadMore button DataTable.
  final VoidCallback? loadMoreButtonOnPressed;

  /// Custom widget to display when no data is available.
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TContainer(
          height: (tableHeight ?? TDeviceUtils.getScreenHeight(context) * 0.7) +
              (TDeviceUtils.isDesktopScreen(context) ? 70 : 130),
          child: (isLoading && rows.isEmpty)
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    if (header != null || actions.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (header != null) Expanded(child: header!),
                            Row(children: actions),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: tableHeight ??
                          TDeviceUtils.getScreenHeight(context) * 0.7,
                      child: DataTable2(
                        /// COLUMNS & ROWS
                        rows: rows,
                        columns: columns,
                        columnSpacing: 12,
                        minWidth: minWidth,
                        dividerThickness: 0,
                        horizontalMargin: 12,
                        dataRowHeight: dataRowHeight,

                        /// CHECKBOX
                        showCheckboxColumn: true,
                        showHeadingCheckBox: true,
                        checkboxAlignment: Alignment.centerLeft,

                        /// HEADER DESIGN
                        headingTextStyle:
                            Theme.of(context).textTheme.titleMedium,
                        headingRowColor: WidgetStateProperty.resolveWith(
                            (states) => TColors.primaryBackground),
                        headingRowDecoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.borderRadiusMd),
                            topRight: Radius.circular(TSizes.borderRadiusMd),
                          ),
                        ),
                        empty: emptyWidget ??
                            TAnimationLoader(
                              animation: 'assets/images/animations/table.gif',
                              optionalMessage: Text('Nothing Found'),
                              height: 200,
                              width: 200,
                            ),

                        /// SORTING
                        sortAscending: sortAscending,
                        sortColumnIndex: sortColumnIndex,
                        sortArrowBuilder: (bool ascending, bool sorted) {
                          if (sorted) {
                            return Icon(
                                ascending
                                    ? Iconsax.arrow_up_3
                                    : Iconsax.arrow_down,
                                size: TSizes.iconSm);
                          } else {
                            return Icon(Iconsax.arrow_swap,
                                size: TSizes.iconSm);
                          }
                        },
                      ),
                    ),

                    /// SPACE TO KEEP FOOTER AT THE BOTTOM
                    if (!hideFooter) const Spacer(),

                    /// FOOTER
                    if (!hideFooter) const Divider(),
                    if (!hideFooter) _footer(context)
                  ],
                ),
        ),
        if (!hideLoadMore) SizedBox(height: TSizes.spaceBtwSections),

        /// LOAD MORE
        if (!hideLoadMore) loadMoreButton(),
      ],
    );
  }

  Widget _footer(BuildContext context) {
    return TDeviceUtils.isDesktopScreen(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Showing ${rows.length} Row(s)',
                  style: Theme.of(context).textTheme.bodySmall),
              if (allItemsFetched)
                Text('You\'re seeing all the records that match your filters!',
                    style: Theme.of(context).textTheme.bodySmall),
              const SizedBox()
            ],
          )
        : Column(
            children: [
              Text('Showing ${rows.length} Row(s)',
                  style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: TSizes.spaceBtwItems),
              if (allItemsFetched)
                Text(
                  'You\'re seeing all the records that match your filters!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
          );
  }

  Widget loadMoreButton() {
    /// Table Load More
    if (isLoading && rows.isNotEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else if (rows.isNotEmpty && !allItemsFetched) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: ElevatedButton(
                onPressed: loadMoreButtonOnPressed,
                child: const Text('Load More')),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
