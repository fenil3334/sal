import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/app_string.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/notificationcontroler/notification_controler.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/images.dart';
import '../../widget/custom_widget.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  NotificationControler controler=Get.put(NotificationControler());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Container(
            color: AppColors.BACKGROUND_COLOR,
            child: Column(
              children: [

                appBar(),

                CustomWidget.verticleLine(),

                notificationList()
              ],
            ),
          )
      ),
    );
  }



  Widget appBar(){
    return Container(
      height: 53.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,

      child: Row(
        children: [
          GestureDetector(
              onTap: (){
                controler.goBack();
              },
              child: WebsafeSvg.asset(ICON_BACK, width: 23.w)),

          Expanded(child: Center(
            child: Text(AppStrings.notification,style: mediumTextStyle(txtColor: AppColors.BLACK,fontSize: 21),),
          )),

          GestureDetector(
              onTap: (){

              },
              child: Image.asset(SEARCH_ICON, width: 20.w)),

        ],
      ),
    );
  }


  Widget notificationList(){
    return Obx((){
      return ListView.builder(
        shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.w),
          itemCount: controler.notificationlist.length,
          itemBuilder: (context,i){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 12.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.light_blue
                    ),
                  ),
                  
                  SizedBox(width: 16.w),
                  
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controler.notificationlist[i].title,style: regularTextStyle(fontSize: 17,txtColor: AppColors.BLACK)),
                                SizedBox(height: 3.w),
                                Text(controler.notificationlist[i].description,style: regularTextStyle(fontSize: 14,txtColor: AppColors.text_grey))
                              ],
                            )
                        ),

                        SizedBox(width: 14.w),

                        Text(controler.notificationlist[i].time,style: regularTextStyle(fontSize: 13,txtColor: AppColors.BLACK))
                      ],
                    ),
                  )
                  
                ],
              ),
            );
          }
      );
    });
  }
}
