import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/styles.dart';

class CustomText{


  static Widget bookAppointmentTitle(String title,double size,Color color){
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: regularTextStyle(fontSize: size,txtColor: color),
    );
  }




  static Widget addclientedittext(String headingtitle,TextEditingController editingController,String hint, TextInputType keyboardtype,List<TextInputFormatter> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(headingtitle,style: regularTextStyle(fontSize: 13,txtColor: AppColors.BLACK)),

        SizedBox(height: 2.w),
        Container(
          height: 46.w,
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1.w, color: AppColors.btn_bordder),
              color: AppColors.WHITE),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              cursorColor: Colors.black,
              controller: editingController,
              maxLines: 1,
              inputFormatters: list,
              textInputAction: TextInputAction.next,
              style: mediumTextStyle(fontSize: 14,txtColor: AppColors.BLACK),
              keyboardType: keyboardtype,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  isDense: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  hintText: hint,
                  hintStyle: regularTextStyle(fontSize: 14,txtColor: AppColors.DARK_GRAY)),
            ),
          ),
        ),
      ],
    );
  }




  static Widget textsizeSourceRegularColor(String title,double size,Color color){
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: mediumTextStyle(fontSize: size,txtColor: color),
    );
  }




  static Widget textField(String hint,ValueChanged<String?> valueChangedHandler){
    return  Expanded(child: TextField(
        cursorColor: Colors.black,
        style: regularTextStyle(fontSize: 14,txtColor: AppColors.BLACK),
        maxLines: 1,
        textInputAction: TextInputAction.done,
        onChanged: (String str) {
          valueChangedHandler(str);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            hintText: hint,
            hintStyle: regularTextStyle(fontSize: 14,txtColor: AppColors.DARK_GRAY),
        )),
    );
  }

}