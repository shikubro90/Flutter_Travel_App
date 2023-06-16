import 'dart:convert';
import 'package:flutter_travel_app/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseURl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseURl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print("shikupring${list}");
        return list.map((e) => DataModel.fromJson(e)).toList();
        // return List<DataModel>.generate(list.length, (index) => DataModel.fromJson(list[index]));

      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
