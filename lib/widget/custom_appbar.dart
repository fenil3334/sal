import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/View/homescreen/home_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../config/utils/app_string.dart';

typedef void OnTap();

class CustomAppBar {



  static Widget homeAppBar({String title='',required OnTap onTapmenu,required OnTap onTapNotifi,bool isbackicon=false}){
    return Container(
      height: 53.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,

      child: Row(
        children: [
          GestureDetector(
              onTap: onTapmenu,
              child: WebsafeSvg.asset(isbackicon ? ICON_BACK : MENU_ICON, width: 22.w)),

          Expanded(child: Center(
            child: Text(title,style: mediumTextStyle(txtColor: AppColors.BLACK,fontSize: 20),),
          )),

          GestureDetector(
              onTap: onTapNotifi,
              child: WebsafeSvg.asset(ICON_NOTIFICATION, width: 18.w)),

        ],
      ),
    );
  }


  static Widget homeAppBarBlue({String title='',required OnTap onTapmenu,required OnTap onTapNotifi,bool isbackicon=false}){
    return Container(
      height: 53.w,
      color: AppColors.BLUE,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,

      child: Row(
        children: [
          GestureDetector(
              onTap: onTapmenu,
              child: WebsafeSvg.asset(isbackicon ? ICON_BACK : MENU_ICON, width: 22.w,color: AppColors.WHITE)),

          Expanded(child: Center(
            child: Text(title,style: mediumTextStyle(txtColor: AppColors.WHITE,fontSize: 20),),
          )),

          GestureDetector(
              onTap: onTapNotifi,
              child: WebsafeSvg.asset(ICON_NOTIFICATION, width: 18.w,color: AppColors.WHITE)),

        ],
      ),
    );
  }
}
