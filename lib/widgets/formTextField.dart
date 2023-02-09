import 'package:flutter/material.dart';

Widget formTextField(String hintText,keyBoardType,controller){
  return TextField(
    keyboardType: keyBoardType,
    controller: controller,
    decoration: InputDecoration(hintText: hintText),
  );
}