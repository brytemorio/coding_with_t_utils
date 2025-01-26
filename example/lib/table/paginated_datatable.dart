import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/data_table/paginated_data_table.dart';

class ExampleDataSource extends DataTableSource {
  final List<Map<String, dynamic>> data;

  ExampleDataSource(this.data);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;

    final item = data[index];
    return DataRow(
      selected: index % 3 == 0 ? true : false,
      onSelectChanged: (c) {},
      cells: [
        DataCell(Text('${item['id']}'), showEditIcon: true, placeholder: true),
        DataCell(Text('${item['name']}')),
        DataCell(Text('${item['age']}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

class TPaginatedDataTableExample extends StatelessWidget {
  const TPaginatedDataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Data source for the paginated table
    final dataSource = ExampleDataSource(
      List.generate(
        100,
        (index) => {
          'id': index + 1,
          'name': 'Person ${index + 1}',
          'age': 20 + (index % 10),
        },
      ),
    );

    // Define columns
    final columns = [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Age')),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('TPaginatedDataTable Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TPaginatedDataTable(
          columns: columns,
          source: dataSource,
          rowsPerPage: 10,
          tableHeight: 600,
          header: Text('Paginated Users Table',
              style: Theme.of(context).textTheme.titleLarge),
          actions: [
            IconButton(icon: Icon(Icons.filter_list), onPressed: () {})
          ],
          onPageChanged: (pageIndex) {
            print('Page changed to: $pageIndex');
          },
        ),
      ),
    );
  }
}
