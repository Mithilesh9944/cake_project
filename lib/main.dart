import 'package:cake_project/pages/MangeShop.dart';
import 'package:flutter/material.dart';

void main(){
   runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute: 'manageShop',
     routes: {
       'manageShop':(context)=>MyManageShop(),
     },
   ));
}