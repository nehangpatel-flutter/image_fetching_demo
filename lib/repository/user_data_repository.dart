
import 'package:http/http.dart';
import 'package:image_picker_demo/services/network_call.dart';

class UserDataRepository{
  UserDataRepository._privateConstructor();
  static final UserDataRepository _userDataRepository =  UserDataRepository._privateConstructor();
  factory UserDataRepository(){
    return _userDataRepository;
  }

  Future<Response> callUserDataApi(int page) async{
    int offset = 10 * page;
    Response response =  await NetworkCall().callGetApi(offset.toString());
    return response;
  }
}