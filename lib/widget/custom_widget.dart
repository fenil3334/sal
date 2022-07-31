import 'package:flutter/material.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/widget/custom_appbar.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../Config/Utils/color.dart';
import '../Config/Utils/images.dart';
import '../Config/Utils/styles.dart';

class CustomWidget{

  static Widget itemDes(String icon,String title){
    return Row(
      children: [
        Image.asset(icon,color: AppColors.BLACK,width: 11.w),
        SizedBox(width: 7.w),
        Text(title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: regularTextStyle(fontSize: 11,txtColor: AppColors.BLACK)),

      ],
    );
  }



  static Widget appointDetailitemInfo(String icon,String title){
    return Row(
      children: [
        Image.asset(icon,color: AppColors.BLACK,width: 16.w),
        SizedBox(width: 12.w),
        Text(title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: mediumTextStyle(fontSize: 13,txtColor: AppColors.BLACK)),

      ],
    );
  }



  static Widget verticleLine() {
    return Column(
      children: [
        Container(
          height: 0.6.w,
          width: double.infinity,
          color: AppColors.line_color,
        ),
        Container(
          height: 1.4.w,
          width: double.infinity,
          color: AppColors.WHITE,
        ),
      ],
    );
  }



  static Widget whiteRoundButton(String title,OnTap ontap){
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 48.w,
        padding: EdgeInsets.only(left: 13.w,right: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.w),
            border: Border.all(
                width: 0.9.w,
                color: AppColors.btn_bordder
            ),
            color: AppColors.WHITE
        ),

        child: Row(
          children: [
            Expanded(child: Text(title,style: mediumTextStyle(fontSize: 14,txtColor: AppColors.BLACK))),

            WebsafeSvg.asset(DOWN_ARROW_ICON,width: 11.w,color: AppColors.BLACK)
          ],
        ),
      ),
    );
  }




  static Widget blueBottomButton(String title,OnTap ontap){
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 52.w,
        color: AppColors.BLUE,

        child: Center(
          child: Text(title,style: regularTextStyle(fontSize: 15,txtColor: AppColors.WHITE)),
        ),
      ),
    );
  }




  static Widget dateButton(String date,OnTap ontap){
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 48.w,
        padding: EdgeInsets.only(left: 13.w,right: 9.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.w),
            border: Border.all(
                width: 0.9.w,
                color: AppColors.btn_bordder
            ),
            color: AppColors.WHITE
        ),

        child: Row(
          children: [
            WebsafeSvg.asset(APPOINTMENT_UNFILL,width: 18.w,color: AppColors.BLUE),

            SizedBox(width: 12.w),

            Expanded(child: Text(date,style: mediumTextStyle(fontSize: 13,txtColor: AppColors.BLACK))),
          ],
        ),
      ),
    );
  }

  
  
  static Widget filterButton(OnTap onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54.w,
        width: 54.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.BLUE
        ),
        
        child: Center(
          child: Image.asset(FILTER_ICON,width: 22.w,color: AppColors.WHITE),
        ),
      ),
    );
  }

}