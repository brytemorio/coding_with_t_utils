import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/data_table/table_header.dart';

class TTableHeaderExample extends StatelessWidget {
  const TTableHeaderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TTableHeader(
      buttonText: 'Add User',
      onCreatePressed: () => print('Add User'),
      searchController: TextEditingController(),
      onSearchChanged: (value) => print('Search: $value'),
      actions: [
        IconButton(
          icon: const Icon(Icons.download),
          onPressed: () => print('Download CSV'),
        ),
        IconButton(
          icon: const Icon(Icons.print),
          onPressed: () => print('Print Table'),
        ),
      ],
      filters: [
        DropdownButton<String>(
          value: 'Active',
          onChanged: (value) => print('Filter: $value'),
          items: ['Active', 'Inactive', 'Pending']
              .map((status) =>
                  DropdownMenuItem(value: status, child: Text(status)))
              .toList(),
        ),
      ],
      onSort: () => print('Sort'),
      sortLabel: 'Name',
      showSortButton: true,
    );
  }
}
