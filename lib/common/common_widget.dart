



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getImageWidget(String url, BoxShape shape,{double width,double height}){
  return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context,imageProvider){
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: shape,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover
            )
          ),
        );
      },
      errorWidget: (context,image,error){
        return Container(
          height: height,
            width: width,
            child: Center(child: CircularProgressIndicator()));
      },
      placeholder: (context,image){
        return Container(
          height: height,
            width: width,
            child: Center(child: CircularProgressIndicator()));
      },
  );
}