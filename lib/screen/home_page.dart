import 'package:flutter/material.dart';

import '../app_font.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DataTable(columns: [
        DataColumn(
            label: Expanded(
                child: Text(
          "Name",
          style: AppFont.tableHead,
        ))),
        DataColumn(
            label: Expanded(
                child: Text(
          "UID",
          style: AppFont.tableHead,
        ))),
        DataColumn(
            label: Expanded(
                child: Text(
          "Doc Type",
          style: AppFont.tableHead,
        ))),
        DataColumn(
            label: Expanded(
                child: Text(
          "Image",
          style: AppFont.tableHead,
        ))),
      ], rows: [
        DataRow(cells: [
          DataCell(Text("Java")),
          DataCell(Text("uid")),
          DataCell(Text("sd")),
          DataCell(Text("url"))
        ])
      ]
          ),
    );
  }
}
