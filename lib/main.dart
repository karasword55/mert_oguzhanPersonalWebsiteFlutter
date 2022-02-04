

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mert_oguzhan/debug/MyAppForMert.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  String kullanici="mert";

  if(kullanici=="mert"){
    runApp(MyAppForMert());
  }else{
    
  }
  
}

