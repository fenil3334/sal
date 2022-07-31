import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/Controler/bookappointmentcontroler/book_appointment_controler.dart';
import 'package:salon_secret/widget/custom_widget.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/styles.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_text.dart';
import 'dart:math' as math;


class AddBookAppointmentScreen extends StatelessWidget {
  AddBookAppointmentScreen({Key? key}) : super(key: key);

  BookAppointmentControler controler=Get.put(BookAppointmentControler());

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Container(
              color: AppColors.BACKGROUND_COLOR,
              child: Column(
                children: [
                  CustomAppBar.homeAppBar(
                      title : AppStrings.book_appointment,
                      onTapmenu :() {
                        controler.goBack();
                      },
                      onTapNotifi :() {
                        controler.goToNotification();
                      },
                      isbackicon: true),

                  CustomWidget.verticleLine(),



                  Expanded(child: SingleChildScrollView(
                      child: textfieldList())),



                  Container(
                    color: AppColors.BLUE,
                    height: 52.w,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.next,style: regularTextStyle(fontSize: 16,txtColor: AppColors.WHITE)),

                        SizedBox(width: 7.w),

                        Transform.rotate(
                          angle: 180 * math.pi / 180,
                          child: WebsafeSvg.asset(ICON_BACK , width: 18.w,color: AppColors.WHITE),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
        )
    );
  }


  Widget textfieldList(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Obx((){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 26.w),

            CustomText.bookAppointmentTitle(AppStrings.client_type, 13, AppColors.BLACK),

            SizedBox(height: 4.w),

            CustomWidget.whiteRoundButton(controler.clientTypeList[controler.selectClientTypeIndex.value].toString(), () { controler.showClientTypeDailog(); }),



            SizedBox(height: 22.w),

            CustomText.bookAppointmentTitle(AppStrings.appointment_date, 13 ,AppColors.BLACK),

            SizedBox(height: 4.w),


            CustomWidget.dateButton('03/12/2022', () { }),




            SizedBox(height: 22.w),

            CustomText.bookAppointmentTitle(AppStrings.appointment_id, 13 ,AppColors.BLACK),

            SizedBox(height: 4.w),


            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: 48.w,
                padding: EdgeInsets.only(left: 13.w,right: 12.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 0.9.w,
                        color: AppColors.btn_bordder
                    ),
                    color: AppColors.card_border_color
                ),

                child: Row(
                  children: [

                    Expanded(child: Text('FSBH-AP1572',style: mediumTextStyle(fontSize: 13,txtColor: AppColors.BLACK))),
                  ],
                ),
              ),
            ),




            SizedBox(height: 22.w),


            CustomText.bookAppointmentTitle(AppStrings.client_name_number, 13, AppColors.BLACK),

            SizedBox(height: 4.w),

            Row(
              children: [
                Expanded(child:  CustomWidget.whiteRoundButton(controler.namelist[controler.selectNameIndex.value].toString(), () {
                  controler.showClientNameDailog();
                })),
                SizedBox(width: 14.w,),

                GestureDetector(
                  onTap: (){
                    controler.addClientDailog();
                  },
                  child: Container(
                    height: 48.w,
                    width: 48.w,
                    padding: EdgeInsets.only(left: 12.w,right: 9.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            width: 0.9.w,
                            color: AppColors.btn_bordder
                        ),
                        color: AppColors.WHITE
                    ),

                    child: Center(
                      child: Image.asset(PLUS_ICON,width: 18.w, color: AppColors.BLUE),
                    ),
                  ),
                )
              ],
            ),


            SizedBox(height: 10.w),
          ],
        );
      }),
    );
  }
}





