import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/appointmentcontroler/appointment_controler.dart';
import 'package:salon_secret/widget/custom_widget.dart';

class RunningTab extends StatelessWidget {
  RunningTab({Key? key}) : super(key: key);

  AppointmentControler controler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(child: runningListView())
      ],
    );
  }

  Widget runningListView() {
    return Obx(() => ListView.builder(
      shrinkWrap: true,
        padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 24.w),
        physics: BouncingScrollPhysics(),
        itemCount: controler.runningappointment.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: (){
              controler.goToRunningAppointmentDetail();
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 18.w),
              decoration: BoxDecoration(
                  color: AppColors.WHITE,
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(width: 1.w,color: AppColors.appointment_border)
              ),

              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.w,horizontal: 14.w),
                    child: Row(
                      children: [
                        Image.asset(ICON_STAR,width: 14.w),
                        SizedBox(width: 8.w),
                        Image.asset(ICON_MEDAL,width: 14.w,color: AppColors.GREEN),

                        Spacer(),
                        Text(controler.runningappointment[i].status,style: regularTextStyle(fontSize: 13,txtColor: AppColors.BLUE))
                      ],
                    ),
                  ),

                  Container(
                    height: 1.w,
                    color: AppColors.appointment_border,
                  ),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.w),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(controler.runningappointment[i].name,style: mediumTextStyle(fontSize: 15,txtColor: AppColors.BLACK)),

                                    SizedBox(width: 8.w),
                                    Image.asset(ICON_INFO,color: AppColors.BLACK,width: 13.w)
                                  ],
                                ),
                                SizedBox(height: 9.w),
                                CustomWidget.itemDes(ICON_INFO,controler.runningappointment[i].infoMsg),
                                SizedBox(height: 6.w),
                                CustomWidget.itemDes(ICON_INFO,controler.runningappointment[i].appointdescription),
                                SizedBox(height: 6.w),
                                CustomWidget.itemDes(ICON_EDIT,controler.runningappointment[i].clientName),
                              ],
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Image.asset(TIME_ICON,width: 14.w,color: AppColors.BLUE),
                                  SizedBox(width: 5.w),
                                  Text(controler.runningappointment[i].time,style: semiBoldTextStyle(fontSize: 14,txtColor: AppColors.BLUE))
                                ],
                              ),

                              Text(controler.runningappointment[i].date,style: mediumTextStyle(fontSize: 10,txtColor: AppColors.BLACK)),

                              SizedBox(height: 20.w),


                              Text('₹'+controler.runningappointment[i].amount,style: mediumTextStyle(fontSize: 17,txtColor: AppColors.BLACK)),

                              SizedBox(height: 8.w),

                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }




}
