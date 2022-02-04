import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:awesome_loader/awesome_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AdminShareController.dart';

class DashboardController extends GetxController{

  RxInt item=1.obs;

  DashboardController({RxInt? item});

  dynamic createDashboard(int item2,BuildContext context){

    AdminShareController adminShareController=Get.put(AdminShareController());

    TextEditingController kullaniciAdiController=TextEditingController();
    TextEditingController sifreController=TextEditingController();
    

    if(item as RxInt==1){
      
      double boyut;
    boyut=MediaQuery.of(context).size.width;

      // ANASAYFA
      
      return SingleChildScrollView(
        child: Container(
              width: 1400,
              height: 750,
              color: Colors.blueGrey.withOpacity(0.7),
              child: Center(
                child: Container(
                  //color: Colors.blueGrey.withOpacity(0.7),
                  child: Column(children: [
                    Image.network('https://r.resimlink.com/Q1CXJ.png',width: boyut*0.3,height: MediaQuery.of(context).size.height*0.3,),
                    SizedBox(height: 70,),
                    AnimatedTextKit(animatedTexts: [
                      
                      TypewriterAnimatedText("Hi there,my name is Mert. I am a computer engineering student who wants to learn new things. I just want to share whether my poems or opinions about anything.  It may be about software, political or anything. Also, I want to share photos taken by me. Just my poems will be in Turkish.",speed: Duration(milliseconds: 90),textStyle: TextStyle(color: Colors.white,fontSize: 22,fontFamily: "Aclonica")),
                    ]),
                  ],),
                ),
              ),
            ),
      );
    }else if(item as RxInt==2){
      
      BuildContext context2=context;
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      CollectionReference reference = _firestore.collection('GenelYaziCollection');

      // DÜZ YAZILAR
      
      return Container(
        width: 1400,
        height: 750,
        color: Colors.blueGrey.withOpacity(0.7),
          
          child: FutureBuilder<QuerySnapshot>(
            
        // <2> Pass `Stream<QuerySnapshot>` to stream
        
        builder: (context, snapshot) {
          if(snapshot.connectionState!=ConnectionState.done){
            return Container(child: Center(
              child: Text("Loading..",style: TextStyle(color: Colors.white),)
            ),);
          }
          else if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView(
              
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                children: documents
                    .map((doc) => Align(
                      
                      alignment: FractionalOffset.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Card(
                          shadowColor: Colors.red.withOpacity(0.7),
                          borderOnForeground: true,
                          color: Colors.white.withOpacity(0.3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27.0),),
                              child: ListTile(
                                title: Center(child: Text(doc['Baslik'],style: GoogleFonts.supermercadoOne(textStyle: TextStyle(fontSize: 22)))),
                                subtitle: Center(child: Text(doc['GenelYazi'],style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                      ),
                    ))
                    .toList());
          } else if (snapshot.hasError) {
            return Text('Its Error!');
          }else
            return Container(child: Center(
              child: Text("Loading..",style: TextStyle(color: Colors.white),)
            ),);
        },
        future: reference.get(),
        )
          
      );

    }else if(item as RxInt==3){
      
      BuildContext context2=context;
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      CollectionReference reference = _firestore.collection('SiirlerCollection');
      

      // ŞİİRLER
      
      return Container(
        width: 1400,
        height: 750,
        color: Colors.blueGrey.withOpacity(0.7),
          
          child: FutureBuilder<QuerySnapshot>(
            
        // <2> Pass `Stream<QuerySnapshot>` to stream
        
        builder: (context, snapshot) {
          if(snapshot.connectionState!=ConnectionState.done){
            return Container(child: Center(
              child: Text("Loading..",style: TextStyle(color: Colors.white),)
            ),);
          }
          else if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView(
              
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                children: documents
                    .map((doc) => Align(
                      
                      alignment: FractionalOffset.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Card(
                          shadowColor: Colors.red.withOpacity(0.7),
                          borderOnForeground: true,
                          color: Colors.white.withOpacity(0.3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27.0),),
                              child: ListTile(
                                title: Center(child: Text(doc['Baslik'],style: GoogleFonts.supermercadoOne(textStyle: TextStyle(fontSize: 22)))),
                                subtitle: Center(child: Text(doc['Siir'],style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                      ),
                    ))
                    .toList());
          } else if (snapshot.hasError) {
            return Text('Its Error!');
          }else
            return Container(child: Center(
              child: Text("Loading..",style: TextStyle(color: Colors.white),)
            ),);
            
        },
        future: reference.get(),)
          
      );
      

    }else if(item as RxInt==4){
      
      BuildContext context2=context;
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      CollectionReference reference = _firestore.collection('YazilimYazisi');

      // YAZILIM

       return Container(
        width: 1400,
        height: 750,
        color: Colors.blueGrey.withOpacity(0.7),
          
          child: FutureBuilder<QuerySnapshot>(
            
        // <2> Pass `Stream<QuerySnapshot>` to stream
        
        builder: (context, snapshot) {
          if(snapshot.connectionState!=ConnectionState.done){
            return Container(child: Center(
              child: Text("Loading..",style: TextStyle(color: Colors.white),)
            ),);
          }
          else if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView(
              
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                children: documents
                    .map((doc) => Align(
                      
                      alignment: FractionalOffset.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Card(
                          shadowColor: Colors.red.withOpacity(0.7),
                          borderOnForeground: true,
                          color: Colors.white.withOpacity(0.3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27.0),),
                              child: ListTile(
                                title: Center(child: Text(doc['Baslik'],style: GoogleFonts.supermercadoOne(textStyle: TextStyle(fontSize: 22)))),
                                subtitle: Center(child: Text(doc['YazilimYazisi'],style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                      ),
                    ))
                    .toList());
          } else if (snapshot.hasError) {
            return Text('Its Error!');
          }else
            return Container(child: Center(
              child: Text("Loading..",style: TextStyle(color: Colors.white),)
            ),);
        },
        future: reference.get(),
        )
          
      );


    }else if(item as RxInt==5){
      

      // FOTOĞRAFLAR

      return SingleChildScrollView(
        child: Container(
              width: 1400,
              height: 750,
              color: Colors.blueGrey.withOpacity(0.7),
            ),
      );
    }
    else if(item as RxInt==6){
      

      // FOTOĞRAF PAYLAŞ

      return SingleChildScrollView(
        child: Container(
              width: 1400,
              height: 750,
              color: Colors.blueGrey.withOpacity(0.7),
            ),
      );

    }else if(item as RxInt==7){
      

      // YAZI PAYLAŞ

      return SingleChildScrollView(
        child: Container(
              width: 1400,
              height: 750,
              color: Colors.blueGrey.withOpacity(0.7),
            ),
      );

    }else if(item as RxInt==8){
      

      

      // ADMIN GİRİŞİ

      
      return SingleChildScrollView(
        child: Container(
          
          child: Center(
            child: Container(
                  width: 250,
                  height: 350,
                  //color: Colors.yellowAccent.withOpacity(0.7),
                  child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(blurStyle: BlurStyle.solid,color: Colors.blueAccent.withOpacity(0.6),spreadRadius: 8,blurRadius: 4)],color: Colors.white24.withOpacity(0.66),borderRadius: BorderRadius.circular(38.0)),
            child: Column(
              children: [
                SizedBox(height: 10.0,),
                Container(
                  child: Text("Admin Giriş Ekranı",style: TextStyle(fontSize: 17.0,color: Colors.black,decoration: TextDecoration.none),),
                ),
                SizedBox(height: 28.0),
                // USERNAME
                Container(
                  child: TextField(
                    controller: kullaniciAdiController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(15.0),
                        ),
                      ),
                      prefixIcon: Icon(Icons.code),
                      hintText: 'Kullanıcı Adı',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 10),
                    ),
                  ),
                ),
                
                SizedBox(height:15.0),
                
                // Şifre
                Container(
                  child: TextField(
                    controller: sifreController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(15.0),
                        ),
                      ),
                      prefixIcon: Icon(Icons.code),
                      hintText: 'Şifre',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 10),
                    ),
                  ),
                ),
                
                SizedBox(height: 5.0,),
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.17)),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),side: BorderSide(color: Colors.amber)))),onPressed: (){String sifre2=sifreController.text.toString();
                String kullaniciAdi2=kullaniciAdiController.text.toString(); adminShareController.signIn(email: kullaniciAdi2, password: sifre2).then((value){if(value==null){Get.toNamed('adminShare');}});}, child: Text("Giriş Yap",style: TextStyle(color: Colors.amber.withOpacity(0.77)),)),
              ],
            ),
        
              ),
                ),
          ),
        ),
      );

    }

    


  }



}