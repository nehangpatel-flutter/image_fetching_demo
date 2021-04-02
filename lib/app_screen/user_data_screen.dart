import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_demo/bloc/user_data_cubit.dart';
import 'package:image_picker_demo/common_widget.dart';
import 'package:image_picker_demo/repository/user_data_repository.dart';
import 'package:image_picker_demo/services/network_call.dart';

class UserDataScreen extends StatefulWidget {
  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {

  var userDataCubit = UserDataCubit(UserDataRepository());

  @override
  void initState() {
    userDataCubit.callUserDataApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder(
          bloc: userDataCubit,
          builder: (BuildContext context, state) {
            if(state is UserDataInitial){
              return Center(child: CircularProgressIndicator());
            }else {
              return Container(
                margin: EdgeInsets.all(15.0),
                child: ListView.builder(itemBuilder: (context,position){
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                        child: Row(
                          children: [
                            getImageWidget(userDataCubit.userDataModel.data.users[position].image,BoxShape.circle,width: 60.0,height: 60.0),
                            SizedBox(
                              width: 10.0,),
                            Expanded(
                              child: Text(userDataCubit.userDataModel.data.users[position].name,style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0
                              ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                          visible: userDataCubit.userDataModel.data.users[position].items.length%2!=0,
                          child: getImageWidget(userDataCubit.userDataModel.data.users[position].items[0],BoxShape.rectangle,width: double.infinity,height: MediaQuery.of(context).size.width/2)),
                      Visibility(
                        visible: userDataCubit.userDataModel.data.users[position].items.length>1,
                        child: SizedBox(
                          height: 10.0,
                        ),
                      ),
                      Visibility(
                        visible: userDataCubit.userDataModel.data.users[position].items.length>1,
                        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0
                        ),
                          itemBuilder: (context,index){
                            return getImageWidget(userDataCubit.userDataModel.data.users[position].items.length%2!=0?userDataCubit.userDataModel.data.users[position].items[index+1]:userDataCubit.userDataModel.data.users[position].items[index],BoxShape.rectangle);
                          },itemCount: userDataCubit.userDataModel.data.users[position].items.length%2!=0?userDataCubit.userDataModel.data.users[position].items.length-1:userDataCubit.userDataModel.data.users[position].items.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                        ),
                      ),
                    ],
                  );
                },itemCount: userDataCubit.userDataModel.data.users.length,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
