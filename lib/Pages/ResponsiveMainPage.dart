import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mert_oguzhan/Controllers/DashboardController.dart';
import 'package:mert_oguzhan/Controllers/MainPageController.dart';

class ResponsiveMainPage extends StatelessWidget {
  const ResponsiveMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainPageController=Get.put(MainPageController());
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Row(
            children: [
              SizedBox(height: 10,),
              Expanded(
                  flex: 1,
                  child: mainPageController.createSideMenu(context),
                ),
                Expanded(
                  flex: 5,
                  child: mainPageController.createDashboard(context),
                ),
            ],
          ),
        ),
      ),
    );
  }
}