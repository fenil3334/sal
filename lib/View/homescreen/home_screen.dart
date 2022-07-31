import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/app_string.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/homescreencontroler/home_screen_controler.dart';
import 'package:salon_secret/View/appointments/appointments_screen.dart';
import 'package:salon_secret/View/homescreen/appointment_page.dart';
import 'package:salon_secret/View/homescreen/dashboard_page.dart';
import 'package:salon_secret/View/homescreen/report_page.dart';
import 'package:salon_secret/View/homescreen/setting_page.dart';
import 'package:websafe_svg/websafe_svg.dart';



typedef void OnTap();



class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeScreenControler controler = Get.put(HomeScreenControler());

  final List<Widget> _pages = [
    DashboardPage(),
    AppointmentsScreen(0),
    ReportPage(),
    SettingPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx((){
          return _pages[controler.pageIndex.value];
        }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              controler.goToBookAppointment();
            },
            tooltip: '',
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child:  WebsafeSvg.asset(ADD_APPOINTMENT, width: 22.w),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: AppColors.WHITE,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 60.w,
              child: Obx((){
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      bottomMenuIcon(controler.pageIndex.value==0 ? DASHBOARD_FILL : DASHBOARD_UNFILL,AppStrings.dashboard,0,(){
                        controler.pageIndex.value=0;
                      }),


                      bottomMenuIcon(controler.pageIndex.value==1 ? APPOINTMENT_FILL : APPOINTMENT_UNFILL,AppStrings.appointments,1,(){
                        controler.pageIndex.value=1;
                      }),


                      Expanded(
                          child: Container()
                      ),


                      bottomMenuIcon(controler.pageIndex.value==2 ? REPORT_FILL : REPORT_UNFILL,AppStrings.reports,2,(){
                        controler.pageIndex.value=2;
                      }),


                      bottomMenuIcon(controler.pageIndex.value==3 ? SETTING_FILL : SETTING_UNFILL,AppStrings.settings,3,(){
                        controler.pageIndex.value=3;
                      })

                    ]);
              }),
            )));
  }



  Widget bottomMenuIcon(String icon, String title,int currentMenuIndex,OnTap onTap){
    return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon, width: 20.w),

              SizedBox(height: 4.w,),
              bottomnavigationText(title,controler.pageIndex.value==currentMenuIndex ? AppColors.select_menu_color : AppColors.unselect_menu_color)
            ],
          ),
        ));

     /* Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WebsafeSvg.asset(icon, width: 20.w),

              SizedBox(height: 4.w,),
              bottomnavigationText(title,controler.pageIndex.value==currentMenuIndex ? AppColors.select_menu_color : AppColors.unselect_menu_color)
            ],
          ),
        ));*/
  }




  Widget bottomnavigationText(String text, Color textColor) {
    return Text(text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: mediumTextStyle(txtColor: textColor, fontSize: 11));
  }
}
