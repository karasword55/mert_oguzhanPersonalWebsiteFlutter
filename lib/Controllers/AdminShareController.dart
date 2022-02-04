import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

class AdminShareController extends GetxController{
  // BURADA; YAZDIĞIM YAZI VE FOTOĞRAFLARI FIREBASE'E KAYDEDECEĞİM.
  // BURADAN; SAYFALARDA EKRANA ÇIKACAK OLAN YAZILARI GET METHODU İLE ALACAĞIM

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

static String? userUid;
List<dynamic> siirList=[].obs;


  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;


  Future signIn({required String email,required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      debugPrint("sign in correct!");
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future shareSiir({required String siir,required String baslik})async{


    _firestore.collection("SiirlerCollection").add(
  {
    "Siir" : siir,
    "Baslik" : baslik,
    
  }).then((value){
    print(value.id);
  });





    /*final CollectionReference _mainCollection = _firestore.collection('SiirlerCollection');

    DocumentReference documentReferencer =
  _mainCollection.doc(userUid).collection('Siirler').doc();

  Map<String, dynamic> data = <String, dynamic>{
    "Baslik": baslik,
    "Siir": siir,
  };

  await documentReferencer
      .set(data)
      .whenComplete(() => print("Şiir eklendi!"))
      .catchError((e) => print(e));*/
    
    

  }


  Future shareYazilimYazisi({required String yazilimYazisi,required String baslik})async{

    /*final CollectionReference _mainCollection = _firestore.collection('YazilimYazisiCollection');

    DocumentReference documentReferencer =
  _mainCollection.doc(userUid).collection('Yazilar').doc();

  Map<String, dynamic> data = <String, dynamic>{
    "YazilimYazisi": yazilimYazisi,
  };

  await documentReferencer
      .set(data)
      .whenComplete(() => print("Yazılım Yazısı eklendi!"))
      .catchError((e) => print(e));*/

      _firestore.collection("YazilimYazisi").add( 
  {
    "YazilimYazisi" : yazilimYazisi,
    "Baslik" : baslik,
    
  }).then((value){
    print(value.id);
  });



  }

  Future shareGenelYazi({required String baslik,required String genelYazi})async{

    _firestore.collection("GenelYaziCollection").add( 
  {
    "GenelYazi" : genelYazi,
    "Baslik" : baslik,
    
  }).then((value){
    print(value.id);
  });

    /*final CollectionReference _mainCollection = _firestore.collection('GenelYazilarCollection');

    DocumentReference documentReferencer =
  _mainCollection.doc(userUid).collection('GenelYazilar').doc();

  Map<String, dynamic> data = <String, dynamic>{
    "GenelYaziBaslik": baslik,
    "GenelYazi": genelYazi,
  };

  await documentReferencer
      .set(data)
      .whenComplete(() => print("Genel Yazı eklendi!"))
      .catchError((e) => print(e));*/

  }


  dynamic getSiirler() async{

    List<dynamic>? liste;

   //return _firestore.collection('SiirlerCollection').snapshots().map((snapshot) => snapshot.docs.map((e) =>e.data() ).toList());

    debugPrint("getŞiirler methoduna girdi");
    CollectionReference reference = _firestore.collection('SiirlerCollection');

    reference.get().then((querySnapshot) => {
      querySnapshot.docs.forEach((result) {
        liste!.add(result.data());
        print(result.data());
      })
    });
    return reference.get();





    /*QuerySnapshot querySnapshot=await reference.get();
    final allData=querySnapshot.docs.map((e) => e.data()).toList();
    print(allData);*/
    
    /*try {
      await reference.get().then((querySnapshot){

        querySnapshot.docs.forEach((element) { 
          print(element["Siir"].toString());
          siirList.add(element.data());

        });
        return siirList;
      });
      //return siirList;
    } catch (e) {
      print(e);
      return null;
    }*/




    /*final CollectionReference _mainCollection = _firestore.collection('SiirlerCollection');

    CollectionReference reference =
    _mainCollection.doc(userUid).collection('Yazilar');

  return reference.snapshots();*/
    
  }

  dynamic uploadPhoto()async{

    Image? fromPicker = await ImagePickerWeb.getImageAsWidget();

    return fromPicker;



  }


  dynamic sharePhoto(dynamic pickedImage)async{

    FirebaseStorage storage = FirebaseStorage.instance;
    
    var pickedImage2=pickedImage;

    Reference reference=storage.ref().child('photos');
    UploadTask uploadTask=reference.putBlob(pickedImage2);


    uploadTask.then((res) {
    res.ref.getDownloadURL();
    });

    



    



  }

} 