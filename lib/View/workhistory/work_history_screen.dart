import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Helper/my_behavior.dart';
import 'package:salon_secret/Controler/workhistorycontrolwe/work_history_controler.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/color.dart';
import '../../Config/Utils/images.dart';
import '../../Config/Utils/styles.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_widget.dart';

class WorkHistoryScreen extends StatelessWidget {
  WorkHistoryScreen({Key? key}) : super(key: key);

  WorkHistoryControler controler=Get.put(WorkHistoryControler());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColors.BACKGROUND_COLOR,
          child: Column(
            children: [

              CustomAppBar.homeAppBar(
                  title : AppStrings.work_history,
                  onTapmenu :() {
                    controler.goBack();
                  },
                  onTapNotifi :() {
                    controler.goToNotification();
                  },
                  isbackicon: true),

              CustomWidget.verticleLine(),


              Expanded(
                  child: Stack(
                    children: [

                      Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: historyListView()
                      ),


                      Positioned(
                          bottom: 18.w,
                          right: 14.w,
                          child: CustomWidget.filterButton(() {
                            controler.showFilterDailog();
                          }))

                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }



  Widget historyListView(){
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.w),
        itemCount: controler.historylist.length,
          itemBuilder: (context,i){

          Color? statuscolor;
          if(controler.historylist[i].status.toString()=="Completed"){
            statuscolor=AppColors.GREEN;
          }else{
            statuscolor=AppColors.RED;
          }

          return Container(
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
                      Text(controler.historylist[i].status,style: regularTextStyle(fontSize: 13,txtColor: statuscolor))
                    ],
                  ),
                ),

                Container(
                  height: 1.w,
                  color: AppColors.appointment_border,
                ),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(controler.historylist[i].name,style: mediumTextStyle(fontSize: 15,txtColor: AppColors.BLUE)),

                                SizedBox(width: 8.w),
                                Image.asset(ICON_INFO,color: AppColors.BLACK,width: 13.w)
                              ],
                            ),

                            SizedBox(height: 9.w),

                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                      children: [
                                        WebsafeSvg.asset(APPOINTMENT_UNFILL,color: AppColors.BLACK,width: 12.w),
                                        SizedBox(width: 8.w),
                                        Expanded(child: Text(controler.historylist[i].date,style: semiBoldTextStyle(fontSize: 11,txtColor: AppColors.BLACK))),
                                      ],
                                    )
                                ),


                                Expanded(
                                    child: Row(
                                      children: [
                                        Image.asset(TIME_ICON,color: AppColors.BLACK,width: 12.w),
                                        SizedBox(width: 8.w),
                                        Expanded(child: Text(controler.historylist[i].time,style: semiBoldTextStyle(fontSize: 11,txtColor: AppColors.BLACK))),
                                      ],
                                    )
                                ),
                              ],
                            ),
                            SizedBox(height: 6.w),
                            CustomWidget.itemDes(ICON_INFO,controler.historylist[i].infomsf),
                            SizedBox(height: 6.w),
                            CustomWidget.itemDes(ICON_INFO,controler.historylist[i].des),
                            SizedBox(height: 6.w),
                            CustomWidget.itemDes(ICON_EDIT,controler.historylist[i].clientname),
                          ],
                        ),
                      ),


                      SizedBox(width: 14.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Text('₹. '+controler.historylist[i].amount,style: mediumTextStyle(fontSize: 23,txtColor: AppColors.BLACK))

                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
          }
      ),
    );
  }
}
