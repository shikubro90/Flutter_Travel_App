import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

 class DataServices {
  String baseURl = "http://mark.bslmeiyu.com/api";
  getInfo() async{
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseURl+apiUrl));
    try{
        if(res.statusCode==200){
          List<dynamic> list = json.decode(res.body);
        }
    }catch(e){

    }
  }
}