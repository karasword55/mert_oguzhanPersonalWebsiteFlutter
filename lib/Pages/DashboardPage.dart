import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mert_oguzhan/Controllers/DashboardController.dart';

class DashboardPage extends StatefulWidget {
  RxInt item;
  
  DashboardPage({Key? key,required this.item}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    final dashboardController=Get.put(DashboardController());
    return Obx(()=>dashboardController.createDashboard(widget.item.value,context)); 
  }
}