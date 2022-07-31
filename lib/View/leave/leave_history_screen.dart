import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Helper/my_behavior.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/leavecontroler/leave_history_controler.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/app_string.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_widget.dart';

class LeaveHistoryScreen extends StatelessWidget {
  LeaveHistoryScreen({Key? key}) : super(key: key);

  LeaveHistoryControler controler=Get.put(LeaveHistoryControler());


  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColors.BACKGROUND_COLOR,
          child: Column(
            children: [

              CustomAppBar.homeAppBar(
                  title : AppStrings.leave_history,
                  onTapmenu :() {
                    controler.goBack();
                  },
                  onTapNotifi :() {
                    controler.goToNotification();
                  },
                  isbackicon: true),

              CustomWidget.verticleLine(),


              Expanded(child: Stack(
                children: [
                  Positioned(
                      top :0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: leaveHistoryList()),


                  Positioned(
                    bottom: 18.w,
                      right: 14.w,
                      child: CustomWidget.filterButton(() {
                        controler.showFilterDailog();
                      }))
                ],
              )),



              GestureDetector(
                onTap: (){
                  controler.goToAddLeaveScreen();
                },
                child: Container(
                  height: 52.w,
                  color: AppColors.BLUE,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ADD_ROUNDED_ICON,width: 20.w,color: AppColors.WHITE),

                      SizedBox(width: 8.w),
                      Text(AppStrings.add_leave,style: regularTextStyle(fontSize: 17,txtColor: AppColors.WHITE)),
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


  Widget leaveHistoryList(){
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
          itemCount: controler.historyList.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 14.w),
          itemBuilder: (context,i){


            Color? selectcolor;
            if(controler.historyList[i].status.toString()=="Pending"){
              selectcolor=AppColors.pending_color;
            }else if(controler.historyList[i].status.toString()=="Approved"){
              selectcolor=AppColors.approve_color;
            }else if(controler.historyList[i].status.toString()=="Rejected"){
              selectcolor=AppColors.RED;
            }

            return Obx(() => GestureDetector(
              onTap: (){
                controler.onTabListIndex.value=i;
              },
              child: Container(
                margin: EdgeInsets.only(top: 22.w),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Expanded(child: Text(controler.historyList[i].date,style: mediumTextStyle(fontSize: 15,txtColor: AppColors.BLACK))),
                        Text(controler.historyList[i].time,style: mediumTextStyle(fontSize: 15,txtColor: AppColors.BLACK))
                      ],
                    ),


                    SizedBox(height: 8.w),

                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.w), // if you need this
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.w,top: 14.w,bottom: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Expanded(
                                  child: Column(
                                    children: [

                                      Row(
                                        children: [
                                          Container(
                                            height: 30.w,
                                            width: 30.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                color: AppColors.leave_his_icon_bg
                                            ),
                                            child: Center(
                                              child: WebsafeSvg.asset(APPOINTMENT_UNFILL,color: AppColors.BLUE,width: 13.w),
                                            ),
                                          ),

                                          SizedBox(width: 12.w),

                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(controler.historyList[i].title,style: regularTextStyle(fontSize: 13,txtColor: AppColors.TXT_LIGHT_SUB_TITLE)),
                                                SizedBox(height: 1.w),
                                                Text(controler.historyList[i].fromdate+" to "+controler.historyList[i].todate,style: regularTextStyle(fontSize: 14,txtColor: AppColors.TXT_LIGHT_SUB_TITLE)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),





                                      Visibility(
                                          visible: controler.onTabListIndex.value==i ? true : false,
                                          child: Column(
                                            children: [

                                              SizedBox(height: 18.w),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 30.w,
                                                    width: 30.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(100),
                                                        color: AppColors.leave_his_icon_bg
                                                    ),
                                                    child: Center(
                                                      child: WebsafeSvg.asset(APPOINTMENT_UNFILL,color: AppColors.BLUE,width: 13.w),
                                                    ),
                                                  ),

                                                  SizedBox(width: 12.w),

                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Reason',style: regularTextStyle(fontSize: 13,txtColor: AppColors.TXT_LIGHT_SUB_TITLE)),
                                                        SizedBox(height: 1.w),
                                                        Text('Having fever from last night',style: regularTextStyle(fontSize: 14,txtColor: AppColors.TXT_LIGHT_SUB_TITLE)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 18.w),

                                              Row(
                                                children: [
                                                  Container(
                                                    height: 30.w,
                                                    width: 30.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(100),
                                                        color: AppColors.leave_his_icon_bg
                                                    ),
                                                    child: Center(
                                                      child: WebsafeSvg.asset(APPOINTMENT_UNFILL,color: AppColors.BLUE,width: 13.w),
                                                    ),
                                                  ),

                                                  SizedBox(width: 12.w),

                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Type of Leave',style: regularTextStyle(fontSize: 13,txtColor: AppColors.TXT_LIGHT_SUB_TITLE)),
                                                        SizedBox(height: 1.w),
                                                        Text('Sick Leave',style: regularTextStyle(fontSize: 14,txtColor: AppColors.TXT_LIGHT_SUB_TITLE)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )

                                            ],
                                          )
                                      )
                                    ],
                                  ),
                                ),



                                Container(
                                  height: 26.w,
                                  width: 82.w,
                                  padding: EdgeInsets.only(left: 16.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                      color: selectcolor
                                  ),

                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(controler.historyList[i].status.toString(),style: regularTextStyle(fontSize: 11,txtColor: AppColors.WHITE)),
                                  ),
                                )
                              ],
                            ),


                            Padding(
                              padding: EdgeInsets.only(right: 12.w,top: 5.w),
                              child: Transform.scale(
                                scaleY: controler.onTabListIndex.value==i ? -1 : 1,
                                  child: WebsafeSvg.asset(DOWN_ARROW_ICON,width: 11.w,color: AppColors.BLACK)
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
          }
      ),
    );
  }
}
