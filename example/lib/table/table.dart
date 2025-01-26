import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/data_table/data_table.dart';

class TDataTableExample extends StatelessWidget {
  const TDataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Define columns
    final columns = [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Age')),
    ];

    // Define rows
    final rows = List<DataRow>.generate(
      10,
      (index) => DataRow(
        cells: [
          DataCell(Text('${index + 1}')),
          DataCell(Text('Person ${index + 1}')),
          DataCell(Text('${20 + index}')),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('TDataTable Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 600,
          child: TDataTable(
            columns: columns,
            rows: rows,
            tableHeight: 400,
            header: Text('Users Table',
                style: Theme.of(context).textTheme.titleLarge),
            actions: [IconButton(icon: Icon(Icons.refresh), onPressed: () {})],
            loadMoreButtonOnPressed: () {
              print('Load More Pressed!');
            },
            isLoading: false,
            allItemsFetched: false,
            hideFooter: false,
            hideLoadMore: false,
          ),
        ),
      ),
    );
  }
}
