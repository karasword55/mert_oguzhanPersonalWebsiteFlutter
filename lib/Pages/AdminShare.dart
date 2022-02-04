import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mert_oguzhan/Controllers/AdminShareController.dart';

class AdminSharePage extends StatelessWidget {
  const AdminSharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AdminShareController adminShareController=Get.put(AdminShareController());

    TextEditingController siirController=TextEditingController();
    TextEditingController genelYaziController=TextEditingController();
    TextEditingController yazilimYaziController=TextEditingController();
    TextEditingController baslikController=TextEditingController();
    TextEditingController genelYaziBaslikController=TextEditingController();
    TextEditingController yazilimYaziBaslikController=TextEditingController();
    

    var pickedImage;

    
    
    
    

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20,),
              SingleChildScrollView(
                child: Container(
                  color: Colors.white54,
                  child: Column(children: [
                    Text('Şiir Yaz',style: TextStyle(color:Colors.black),),
                    SizedBox(height: 20,),
                    TextField(
                      controller: baslikController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    TextField(
                      controller: siirController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    ElevatedButton(onPressed: (){String siir=siirController.text.toString();String baslik=baslikController.text.toString();adminShareController.shareSiir(siir: siir, baslik: baslik);}, child: Text("şiirini paylaş"))
                  ],),
                ),
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                child: Container(
                  color: Colors.white54,
                  child: Column(children: [
                    Text('Yazılım Hakkında Yaz',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 20,),
                    TextField(
                      controller: yazilimYaziBaslikController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    TextField(
                      controller: yazilimYaziController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    ElevatedButton(onPressed: (){String baslik=yazilimYaziBaslikController.text.toString();String yazilimYazi=yazilimYaziController.text.toString();adminShareController.shareYazilimYazisi(yazilimYazisi: yazilimYazi,baslik: baslik);}, child: Text("yazılım gönderini paylaş"))
                  ],),
                ),
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                child: Container(
                  color: Colors.white54,
                  child: Column(children: [
                    Text('Genel Yazı Yaz',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 20,),
                    TextField(
                      controller: genelYaziBaslikController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    TextField(
                      controller: genelYaziController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    ElevatedButton(onPressed: (){String genelYazi=genelYaziController.text.toString();
                    String genelYaziBaslik=genelYaziBaslikController.text.toString();adminShareController.shareGenelYazi(baslik: genelYaziBaslik, genelYazi: genelYazi);}, child: Text("genel yazını paylaş"))
                  ],),
                ),
              ),
              // SHARE PHOTO
              /*SingleChildScrollView(
                child: Container(
                  color: Colors.white54,
                  child: Column(children: [
                    Text('Fotograf paylaş',style: TextStyle(color: Colors.black),),
                    
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){pickedImage= adminShareController.uploadPhoto();}, child: Text("Fotoğrafı Yükle")),
                    Container(width: 50,height: 85,color: Colors.amber,),
                    ElevatedButton(onPressed: (){adminShareController.sharePhoto(pickedImage);}, child: Text("Fotoğrafı paylaş"))
                  ],),
                ),
              ),*/



            ],
          ),
        ),
      ),
    );
  }
}