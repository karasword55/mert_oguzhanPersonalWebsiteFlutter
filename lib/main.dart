

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mert_oguzhan/debug/MyAppForMert.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: 'AIzaSyDD3Ab_WmWHYqUVi7OmWG8rYpf9pjON_PY', 
  appId: '1:62753469944:android:87f37b0d55a4a0edf9120d',
  messagingSenderId: '62753469944', projectId: 'mertoguzhan-5d2de'));

  String kullanici="mert";

  if(kullanici=="mert"){
    runApp(MyAppForMert());
  }else{
    
  }
  
}

