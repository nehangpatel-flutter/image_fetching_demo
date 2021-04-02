import 'dart:developer';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkCall{

  Future<Response> callGetApi() async{
    Response response = await http.get(Uri.parse("http://sd2-hiring.herokuapp.com/api/users?offset=10&limit=10"));
    return response;
  }

}

