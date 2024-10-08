import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_font.dart';
import '../provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
          builder: (context,data,_) {
            return Scaffold(
              appBar: AppBar(title: const Text("Data Table")),
              body: data.dataTableModel.isEmpty ? const Center(child: CircularProgressIndicator()) :  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:DataTable(
                  columns: [
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
                  ],

                  rows: data.dataTableModel.map((e){
                    return DataRow(cells: [
                      DataCell(Text(e.name.toString())),
                      DataCell(Text(e.uid.toString())),
                      DataCell(Text(data.docType(e.docType))),
                      DataCell(Image.network(e.url.toString()))
                    ]);
                  }).toList()
              ),
            ))
            );
          }
      ),
    );
  }
}
