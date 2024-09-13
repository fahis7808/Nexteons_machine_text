import 'package:flutter/foundation.dart';

import '../service/api_service.dart';
import '../model/model.dart';

class HomeProvider extends ChangeNotifier{

  List<DataTableModel> dataTableModel = [];

  HomeProvider(){
    getData();
  }


  getData() async{
    Map<String,dynamic> data = {
      "statusArray": [1],
      "screenType": [],
      "responseFormat": [],
      "globalGalleryIds": [],
      "categoryIds": [],
      "docTypes": [],
      "types": [],
      "limit": 10,
      "skip": 0,
      "searchingText": ""
    };

    var response = await ApiService.fetchData(data);
    List listOfData = response["data"]["list"];
    dataTableModel =listOfData.map((e) => DataTableModel.fromJson(e)).toList();
    onRefresh();
  }

  onRefresh(){
    notifyListeners();
  }

  docType(docType) {
    switch (docType) {
      case 0:
        return "Image";
      case 1:
        return 'Video';
      case 2:
        return 'PDF';
      case 3:
        return 'Audio';
      case 4:
        return 'Document';
      default:
        print('Unknown type');
    }
  }

}

