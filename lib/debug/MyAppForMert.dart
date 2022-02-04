
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:mert_oguzhan/Pages/AdminShare.dart';
import 'package:mert_oguzhan/Pages/ResponsiveMainPage.dart';


class MyAppForMert extends StatelessWidget {

  
  MyAppForMert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mert Oguzhan Personal Website',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        //scaffoldBackgroundColor: loginUIController.renk.value,
        //scaffoldBackgroundColor: Obx(()=> loginUIController.renk.value as Widget) as Color,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/adminShare', page: ()=>AdminSharePage()),
        //GetPage(name: '/login', page: ()=>LoginUIWidget(application)),
        //GetPage(name: '/responsiveMainPage', page: ()=>ResponsiveMainPage()),
        //GetPage(name: '/homePage', page: ()=>MyHomePageForMert(application, title: 'Orkestra'),transition: Transition.leftToRight,transitionDuration: Duration(seconds: 1)),
        //GetPage(name: '/loadingPage', page: ()=>LoadingPage()),
      ],
      home:  MyHomePageForMert(title: 'Orkestra'),
    );
  }
}

class MyHomePageForMert extends StatefulWidget {
  
    MyHomePageForMert({Key? key, required this.title}) : super(key: key);
  
  

  final String title;

  @override
  State<MyHomePageForMert> createState() => _MyHomePageForMertState();
}

class _MyHomePageForMertState extends State<MyHomePageForMert> {


  @override
  Widget build(BuildContext context) {

    debugPrint("scaffold rebuild");
    return ResponsiveMainPage();
  }
}
