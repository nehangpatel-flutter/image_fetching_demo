import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:image_picker_demo/model/userdata_model.dart';
import 'package:image_picker_demo/repository/user_data_repository.dart';
import 'package:meta/meta.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserDataRepository _userDataRepository;
  UserDataModel userDataModel;
  List<Users> users = [];
  bool isPaginationCalled = false;
  UserDataCubit(this._userDataRepository) : super(UserDataInitial());


  callUserDataApi(int page) async{
    if(page!=0){
      isPaginationCalled =true;
     users.add(Users(id: "-11"));
     emit(UserDataLoaded());
    }
      Response response= await _userDataRepository.callUserDataApi(page);
      log("response ${response.body}");
      userDataModel = UserDataModel.fromJson(json.decode(response.body));
      if(page==0){
        users.clear();
      }else{
        isPaginationCalled =false;
        users.removeWhere((element) => element.id=="-11");
      }
      users.addAll(userDataModel.data.users);
      emit(UserDataLoaded());
  }
}
