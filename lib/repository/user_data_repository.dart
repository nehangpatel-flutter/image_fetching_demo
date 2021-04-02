
import 'package:http/http.dart';
import 'package:image_picker_demo/services/network_call.dart';

class UserDataRepository{
  UserDataRepository._privateConstructor();
  static final UserDataRepository _userDataRepository =  UserDataRepository._privateConstructor();
  factory UserDataRepository(){
    return _userDataRepository;
  }

  Future<Response> callUserDataApi() async{
    Response response =  await NetworkCall().callGetApi();
    return response;
  }
}