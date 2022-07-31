import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/settingcontroler/setting_controler.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/app_state_notifyer.dart';
import '../../Config/Utils/app_string.dart';
import '../../Controler/homescreencontroler/home_screen_controler.dart';
import '../../widget/custom_appbar.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  SettingControler controler=Get.put(SettingControler());
  HomeScreenControler homescreencontroler = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CustomAppBar.homeAppBarBlue(
            title: AppStrings.settings,
            onTapmenu: () {
              homescreencontroler.pageIndex.value=0;
            },
            onTapNotifi: () {
              controler.goToNotification();
            },
            isbackicon: true),

        Container(
          height: 0.6.w,
          width: Get.width,
          color: AppColors.WHITE,
        ),

        profileDetail(),


       /* FlutterSwitch(
          activeText: "Light",
          inactiveText: "Dark",
          value: false,
          valueFontSize: 10.0,
          width: 110,
          borderRadius: 30.0,
          showOnOff: true,
          onToggle: (val) {
            Provider.of<AppStateNotifier>(context).updateTheme(val);
          },
        ),
*/
        Expanded(child: menuListView())
      ],
    ));
  }

  Widget profileDetail() {
    return GestureDetector(
      onTap: () {
        controler.goToEditProfile();
      },
      child: Container(
        height: 104.w,
        color: AppColors.BLUE,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    MEN_IMG,
                    width: 64.w,
                    height: 64.w,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 13.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Salim Vanjim',
                    style: regularTextStyle(
                        fontSize: 19, txtColor: AppColors.WHITE)),
                SizedBox(height: 3.w),
                Text('Manager',
                    style: regularTextStyle(
                        fontSize: 13, txtColor: AppColors.WHITE)),
              ],
            ),
            const Spacer(),
            Image.asset(
              SWIPE_RIGHT_ARROW,
              height: 16.w,
              color: AppColors.WHITE,
            ),
          ],
        ),
      ),
    );
  }



  Widget menuListView(){
    return Obx((){
      return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controler.settingList.length,
          itemBuilder: (context,i){
            return GestureDetector(
              onTap: (){
                if(controler.settingList[i].id.toString()=="6"){
                  controler.goToLeaveHistory();
                }else if(controler.settingList[i].id.toString()=="3"){
                  controler.goToWorkHistory();
                }else if(controler.settingList[i].id.toString()=="5"){
                  controler.goToAttendanceDetail();
                }
              },
              child: Column(
                children: [
                  Container(
                    height: 60.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        WebsafeSvg.asset(controler.settingList[i].image,width: 23.w,color: AppColors.BLUE),

                        SizedBox(width: 16.w),

                        Text(controler.settingList[i].title,style: mediumTextStyle(fontSize: 14,txtColor: AppColors.BLACK))
                      ],
                    ),
                  ),


                  i==controler.settingList.length-1 ? Container() : Container(
                    height: 0.6.w,
                    color: AppColors.SHIMMER_BASE,
                  )
                ],
              ),
            );
          }
      );
    });
  }
}


