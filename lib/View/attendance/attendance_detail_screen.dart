import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Helper/my_behavior.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/attendancecontroler/attendance_controler.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Helper/HextoColor.dart';
import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/images.dart';
import '../../widget/custom_appbar.dart';


class AttendanceDetailScreen extends StatelessWidget {
  AttendanceDetailScreen({Key? key}) : super(key: key);

  AttendanceControler controler=Get.put(AttendanceControler());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColors.BACKGROUND_COLOR,

          child: Column(
            children: [

              CustomAppBar.homeAppBar(
                  title : AppStrings.attendance_details,
                  onTapmenu :() {
                    controler.goBack();
                  },
                  onTapNotifi :() {
                    controler.goToNotification();
                  },
                  isbackicon: true),

              Container(
                height: 0.6,
                color: AppColors.DARK_GRAY,
              ),



              Container(
                height: 52.w,
                color: AppColors.WHITE,
                padding: EdgeInsets.symmetric(horizontal: 15.w),

                child: Row(
                  children: [
                    Image.asset(SWIPE_LEFT_ARROW,height: 14.w,color: AppColors.BLUE),

                    Expanded(
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WebsafeSvg.asset(APPOINTMENT_UNFILL,width: 20.w,color: AppColors.BLUE),

                            SizedBox(width: 8.w),
                            Text('December 2022',style: mediumTextStyle(fontSize: 17,txtColor: AppColors.BLUE)),
                          ],
                        )
                    ),

                    Image.asset(SWIPE_RIGHT_ARROW,height: 14.w,color: AppColors.BLUE),
                  ],
                ),
              ),



              Container(
                height: 54.w,

                child: Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                        flex: 2,
                        child: Text(AppStrings.date,style: mediumTextStyle(fontSize: 14,txtColor: AppColors.BLACK))),
                    Expanded(
                        flex: 3,
                        child: Text(AppStrings.check_in,style: mediumTextStyle(fontSize: 14,txtColor: AppColors.BLACK))),
                    Expanded(
                        flex: 3,
                        child: Text(AppStrings.check_out,style: mediumTextStyle(fontSize: 14,txtColor: AppColors.BLACK))),
                    Expanded(
                        flex: 3,
                        child: Text(AppStrings.branch,style: mediumTextStyle(fontSize: 14,txtColor: AppColors.BLACK))),
                    SizedBox(width: 16.w),
                  ],
                ),
              ),


              Expanded(child: listview()),


              GestureDetector(
                onTap: (){
                },
                child: Container(
                  height: 52.w,
                  color: AppColors.BLUE,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WebsafeSvg.asset(ATTENDANCE_ICON,width: 20.w,color: AppColors.WHITE),

                      SizedBox(width: 8.w),
                      Text(AppStrings.add_attendance,style: regularTextStyle(fontSize: 17,txtColor: AppColors.WHITE)),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


  Widget listview(){
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: controler.attendanceList.length,
          itemBuilder: (context,i){
            return Container(
              color: AppColors.WHITE,
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(top: 14.w,bottom: 12.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 16.w),
                        Expanded(
                          flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50.w,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: AppColors.date_bg_color
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(controler.attendanceList[i].date,style: mediumTextStyle(fontSize: 19,txtColor: AppColors.BLACK)),
                                      Text(controler.attendanceList[i].dayName,style: regularTextStyle(fontSize: 12,txtColor: AppColors.BLACK)),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),

                        Expanded(
                            flex: 9,
                            child: controler.attendanceList[i].isHoliday ?
                                Container(
                                  height: 52.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.w),
                                    color: HexColor(controler.attendanceList[i].colorcode.toString())
                                  ),

                                  child: Center(
                                    child: Text(controler.attendanceList[i].holidayname,style: regularTextStyle(fontSize: 13,txtColor: AppColors.BLACK)),
                                  ),
                                ) :

                                ListView.builder(
                                  shrinkWrap: true,
                                    itemCount: controler.attendanceList[i].listSize,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context,i){
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4.w),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    Image.asset(UP_RIGHT_ARROW,width: 11.w,color: AppColors.GREEN),
                                                    Text('09:15 AM',style: regularTextStyle(fontSize: 11,txtColor: AppColors.BLACK)),
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    Image.asset(UP_RIGHT_ARROW,width: 11.w,color: AppColors.RED),
                                                    Text('10:25 PM',style: regularTextStyle(fontSize: 11,txtColor: AppColors.BLACK)),
                                                  ],
                                                )
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Text('Katargam',style: regularTextStyle(fontSize: 11,txtColor: AppColors.BLACK))
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                )
                        ),


                        SizedBox(width: 16.w),
                      ],
                    ),
                  ),


                  Container(
                    height: 2.w,
                    color: AppColors.BACKGROUND_COLOR,
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
