///
/// app_data_table.dart
/// @Date 2020-06-12
/// @Author GuoBin<guobin201314@gmail.com>
/// @Project flutter-material
///
import 'package:flutter/material.dart';
import 'package:fluttermaterial/mock/post.dart';

class AppDataTable extends StatefulWidget {
  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<AppDataTable> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(
                label: Text('Title'),
              ),
              DataColumn(
                label: Text('Author'),
              ),
            ],
            rows: posts.map((e) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(e.title),
                  ),
                  DataCell(
                    Text(e.author),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
