import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mert_oguzhan/Controllers/DashboardController.dart';
import 'package:mert_oguzhan/Pages/DashboardPage.dart';
import 'package:mert_oguzhan/UrlLauncher/Utils.dart';

class MainPageController extends GetxController{


  DashboardController dashboardScreenController2=Get.put(DashboardController());


  dynamic createSideMenu(BuildContext context){
    //DashboardController dashboardScreenController2=Get.find();
    

    double boyut;
    boyut=MediaQuery.of(context).size.width;

    if(boyut>=1200){
      // DESKTOP SIZE
      return Drawer(
      
      backgroundColor: Colors.blueGrey.shade700,
      child: SingleChildScrollView(
        child: Column(

          children: [
      
            DrawerHeader(child: Image.network('https://r.resimlink.com/Q1CXJ.png',width: boyut,height: MediaQuery.of(context).size.height,fit: BoxFit.contain,)),
            SizedBox(height: 15,),
            Text("Mert Oğuzhan",style: TextStyle(color: Colors.white),),
            SizedBox(height: 15,),
            Center(
              child: Row(children: [
                IconButton(onPressed: (){Utils.openLink(url: '');}, icon:Icon(FontAwesomeIcons.instagram),iconSize: 15,color: Colors.white,),
                IconButton(onPressed: (){Utils.openLink(url: 'https://www.linkedin.com/in/mertoguzhan/');}, icon:Icon(FontAwesomeIcons.linkedin),iconSize: 15,color: Colors.white,),
                IconButton(onPressed: (){Utils.openLink(url: 'https://www.youtube.com/channel/UCMYNghi3nqHLkJOjEQriOAg/videos');}, icon:Icon(FontAwesomeIcons.youtube),iconSize: 15,color: Colors.white,),
              ],),
            ),
            SizedBox(height: 15,),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.home,color: Colors.white,),title: "HomePage",press: (){dashboardScreenController2.item.value=1;}),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.auto_stories,color: Colors.white,),title: "Essay",press: (){dashboardScreenController2.item.value=2;},),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.border_color,color: Colors.white,),title: "Poems",press: (){dashboardScreenController2.item.value=3;},),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.adb,color: Colors.white,),title: "Software",press: (){dashboardScreenController2.item.value=4;},),
            //DrawerListTile(color: Colors.white,icon:  Icon(Icons.photo_album,color: Colors.white,),title: "Photos",press: (){dashboardScreenController2.item.value=5;},),
            
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.admin_panel_settings,color: Colors.white,),title: "Admin Panel",press: (){dashboardScreenController2.item.value=8;},),
            //ElevatedButton(onPressed: (){Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light:ThemeMode.dark);}, child: Text("Temayı Değiştir")),
          ],
          
        ),
      ),
    );
    }else if(boyut<1200 && boyut>=1010){
      // TABLET SIZE
      return Drawer(
      
      backgroundColor: Colors.blueGrey.shade700,
      child: SingleChildScrollView(
        child: Column(

          children: [
            DrawerHeader(child: Image.asset('mertAvatar2.png',width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.contain,)),
            SizedBox(height: 15,),
            Text("Mert Oğuzhan",style: TextStyle(color: Colors.white),),
            SizedBox(height: 15,),
            Center(
              child: Row(children: [
                IconButton(onPressed: (){Utils.openLink(url: '');}, icon:Icon(FontAwesomeIcons.instagram),iconSize: 15,color: Colors.white,),
                IconButton(onPressed: (){Utils.openLink(url: 'https://www.linkedin.com/in/mertoguzhan/');}, icon:Icon(FontAwesomeIcons.linkedin),iconSize: 15,color: Colors.white,),
                IconButton(onPressed: (){Utils.openLink(url: 'https://www.youtube.com/channel/UCMYNghi3nqHLkJOjEQriOAg/videos');}, icon:Icon(FontAwesomeIcons.youtube),iconSize: 15,color: Colors.white,),
              ],),
            ),
            SizedBox(height: 15,),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.home,color: Colors.white,),title: "HomePage",press: (){dashboardScreenController2.item.value=1;}),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.auto_stories,color: Colors.white,),title: "Essay",press: (){dashboardScreenController2.item.value=2;},),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.border_color,color: Colors.white,),title: "Poems",press: (){dashboardScreenController2.item.value=3;},),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.adb,color: Colors.white,),title: "Software",press: (){dashboardScreenController2.item.value=4;},),
           // DrawerListTile(color: Colors.white,icon:  Icon(Icons.photo_album,color: Colors.white,),title: "Photos",press: (){dashboardScreenController2.item.value=5;},),
            
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.admin_panel_settings,color: Colors.white,),title: "Admin Panel",press: (){dashboardScreenController2.item.value=8;},),
            
            //ElevatedButton(onPressed: (){Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light:ThemeMode.dark);}, child: Text("Temayı Değiştir")),
          ],
          
        ),
      ),
    );
    }else
      // MOBILE SIZE
      return Drawer(
      
      backgroundColor: Colors.blueGrey.shade700,
      child: SingleChildScrollView(
        child: Column(
          
          
          children: [
      
            DrawerHeader(child: Image.asset('mertAvatar2.png',fit: BoxFit.contain)),
            SizedBox(height: 15,),
            Text("Mert Oğuzhan",style: TextStyle(color: Colors.white),),
            SizedBox(height: 15,),
            Center(
              child: Row(children: [
                Expanded(child: IconButton(onPressed: (){Utils.openLink(url: '');}, icon:Icon(FontAwesomeIcons.instagram),iconSize: 15,color: Colors.white,)),
                Expanded(child: IconButton(onPressed: (){Utils.openLink(url: 'https://www.linkedin.com/in/mertoguzhan/');}, icon:Icon(FontAwesomeIcons.linkedin),iconSize: 15,color: Colors.white,)),
                Expanded(child: IconButton(onPressed: (){Utils.openLink(url: 'https://www.youtube.com/channel/UCMYNghi3nqHLkJOjEQriOAg/videos');}, icon:Icon(FontAwesomeIcons.youtube),iconSize: 15,color: Colors.white,)),
              ],),
            ),
            SizedBox(height: 15,),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.home,color: Colors.white,),press: (){dashboardScreenController2.item.value=1;}, title: '',),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.auto_stories,color: Colors.white,),press: (){dashboardScreenController2.item.value=2;},title: '',),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.border_color,color: Colors.white,),press: (){dashboardScreenController2.item.value=3;},title: '',),
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.adb,color: Colors.white,),press: (){dashboardScreenController2.item.value=4;},title: '',),
           // DrawerListTile(color: Colors.white,icon:  Icon(Icons.photo_album,color: Colors.white,),press: (){dashboardScreenController2.item.value=5;},title: '',),
            
            DrawerListTile(color: Colors.white,icon:  Icon(Icons.admin_panel_settings,color: Colors.white,),press: (){dashboardScreenController2.item.value=8;},title: '',),
            
              
          ],
          
        ),
      ),
    );

    
  }


  dynamic createDashboard(BuildContext context){

    
    //var item2=dashboardScreenController2.item.value as RxInt;

    double boyut;
    boyut=MediaQuery.of(context).size.width;

    if(boyut>=1100){
      // DESKTOP SIZE
      return DashboardPage(item: dashboardScreenController2.item);

      
    }else if(boyut<1100 && boyut>=850){ 
      // TABLET SIZE
      return DashboardPage(item: dashboardScreenController2.item);
    }else
      // MOBILE SIZE
      return DashboardPage(item: dashboardScreenController2.item);

    
  }

  
}


class DrawerListTile extends StatelessWidget {

  const DrawerListTile({
    Key? key, required this.title,required this.press,required this.icon, required this.color
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final Icon icon;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      title: Text(title,style: TextStyle(color: color),),
      leading: icon,
      
    );
  }
}