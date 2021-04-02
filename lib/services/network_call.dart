import 'dart:developer';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkCall{

  Future<Response> callGetApi(String offset) async{
    Response response = await http.get(Uri.parse("http://sd2-hiring.herokuapp.com/api/users?offset=$offset&limit=10"));
    return response;
  }

}

