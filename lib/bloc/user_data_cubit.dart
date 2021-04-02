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
  UserDataCubit(this._userDataRepository) : super(UserDataInitial());


  callUserDataApi() async{
      Response response= await _userDataRepository.callUserDataApi();
      log("response ${response.body}");
      userDataModel = UserDataModel.fromJson(json.decode(response.body));
      emit(UserDataLoaded());
  }
}
