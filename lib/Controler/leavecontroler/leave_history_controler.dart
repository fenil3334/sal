import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/app_string.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Model/leavemodel/leave_history_model.dart';
import 'package:salon_secret/View/notification/notification_screen.dart';
import 'package:salon_secret/widget/custom_widget.dart';

import '../../Config/Utils/images.dart';
import '../../View/leave/add_leave_screen.dart';
import '../../widget/custom_text.dart';

class LeaveHistoryControler extends GetxController{

  TextEditingController reasoncontroler=TextEditingController();

  List<LeaveHistoryModel> historyList=[];
  RxInt selectLeaveTypeIndex=0.obs;
  RxInt selectedLeaveIndex=0.obs;
  List<String> leaveTypelist=[
    'Pending', 'Approved','Rejected'
  ];
  List<String> selectleaveTypelist=[
    'Casual Leave', 'Sick Leave','Marriage Leave','Paternity Leave','Bereavement Leave'
  ];

  RxInt onTabListIndex=(-1).obs;


  @override
  void onInit() {
    super.onInit();

    getHistory();
  }


  getHistory(){
    historyList.add(LeaveHistoryModel('12 Aug, 2022','05:22 PM','Applied Duration','15 Jan,2020','25 Feb, 2020','Pending'));
    historyList.add(LeaveHistoryModel('05 Mar, 2022','01:25 PM','Applied Duration','15 Jan,2020','25 Feb, 2020','Approved'));
    historyList.add(LeaveHistoryModel('25 Jun, 2022','05:14 PM','Applied Duration','15 Jan,2020','25 Feb, 2020','Approved'));
    historyList.add(LeaveHistoryModel('30 Aug, 2022','11:35 PM','Applied Duration','15 Jan,2020','25 Feb, 2020','Pending'));
    historyList.add(LeaveHistoryModel('12 Sep, 2022','08:22 PM','Applied Duration','15 Jan,2020','25 Feb, 2020','Approved'));
    historyList.add(LeaveHistoryModel('19 Aug, 2022','02:54 PM','Applied Duration','15 Jan,2020','25 Feb, 2020','Rejected'));
    historyList.add(LeaveHistoryModel('26 Nov, 2022','10:22 PM','Applied Duration','15 Jan,2020','25 Feb, 2020','Pending'));
    historyList.add(LeaveHistoryModel('24 Des, 2022','05:22 PM','Applied Duration','15 Jan,2020','25 Feb, 2020','Rejected'));
  }



  showFilterDailog(){
    BuildContext context=Get.context!;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.WHITE,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7), topRight: Radius.circular(7)),
        ),
        builder: (builder){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50.w,
                child: Stack(
                  children: [
                    Align(
                        alignment :Alignment.center,
                        child: Text(AppStrings.filter,style: semiBoldTextStyle(fontSize: 21,txtColor: AppColors.BLACK))),

                    Positioned(
                        right : 10.w,top: 0,bottom: 0,child: Center(child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Image.asset(CLOSE_ICON,height: 15.w,color: AppColors.BLACK,),
                        ))))
                  ],
                ),
              ),

              Container(height: 0.7.w,color: AppColors.SHIMMER_BASE,),



              SizedBox(height: 20.w),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.bookAppointmentTitle(AppStrings.from_date, 13 ,AppColors.BLACK),

                                SizedBox(height: 4.w),

                                CustomWidget.dateButton('03/12/2022', () { }),
                              ],
                            )
                        ),

                        SizedBox(width: 26.w),


                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.bookAppointmentTitle(AppStrings.to_date, 13 ,AppColors.BLACK),

                                SizedBox(height: 4.w),

                                CustomWidget.dateButton('03/12/2022', () { }),
                              ],
                            )
                        ),
                      ],
                    ),


                    SizedBox(height: 24.w),


                    CustomText.bookAppointmentTitle(AppStrings.leave_type, 13, AppColors.BLACK),

                    SizedBox(height: 4.w),

                   Obx((){
                     return  CustomWidget.whiteRoundButton(leaveTypelist[selectLeaveTypeIndex.value].toString(), () {
                       showLeaveTypeDailog();
                     });
                   }),


                  ],
                ),
              ),

              SizedBox(height: 16.w),

              CustomWidget.blueBottomButton(AppStrings.apply,() {
                Get.back();
              })
            ],
          );
        }
    );
  }




  showLeaveTypeDailog() {
    BuildContext context=Get.context!;
    showGeneralDialog(
      context: context,
      barrierLabel: "barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 0),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.w),
            child: Material(
              child: Container(
                color: AppColors.WHITE,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 12.w,bottom: 6.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText.textsizeSourceRegularColor(
                                  'Leave Type', 20.sp, AppColors.BLACK),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(6.w),
                                  child: Image.asset(
                                    CLOSE_ICON,
                                    width: 15.w,
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),

                    SizedBox(
                      height: 12.w,
                    ),

                    Container(
                      height: 0.6.w,
                      color: AppColors.DARK_GRAY,
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 10.w),
                        itemCount: leaveTypelist.length,
                        itemBuilder: (context, i) {
                          return Obx(() {
                            return GestureDetector(
                              onTap: () {
                                selectLeaveTypeIndex.value = i;
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: AppColors.TRANSPARENT,
                                    height: 46.w,
                                    margin: EdgeInsets.only(left: 20.w, right: 16.w),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(leaveTypelist[i].toString(),style: regularTextStyle(fontSize: 14,txtColor: selectLeaveTypeIndex==i ? AppColors.BLUE : AppColors.BLACK))),
                                  ),
                                  i==leaveTypelist.length-1 ? Container() : Container(
                                    height: 0.6.w,
                                    color: AppColors.DARK_GRAY,
                                  )
                                ],
                              ),
                            );
                          });
                        }),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 44.w,
                          decoration: BoxDecoration(
                            color: AppColors.BLUE,
                            borderRadius: BorderRadius.circular(5.w),
                          ),

                          child: Center(
                            child: Text(
                              AppStrings.select,
                              style: regularTextStyle(fontSize: 14,txtColor: AppColors.WHITE),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(11.w)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }







  showSelectLeaveTypeDailog() {
    BuildContext context=Get.context!;
    showGeneralDialog(
      context: context,
      barrierLabel: "barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 0),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.w),
            child: Material(
              child: Container(
                color: AppColors.WHITE,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 12.w,bottom: 6.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText.textsizeSourceRegularColor(
                                  'Select Leave Type', 20.sp, AppColors.BLACK),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(6.w),
                                  child: Image.asset(
                                    CLOSE_ICON,
                                    width: 15.w,
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),

                    SizedBox(
                      height: 12.w,
                    ),

                    Container(
                      height: 0.6.w,
                      color: AppColors.DARK_GRAY,
                    ),

                    ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 10.w),
                        itemCount: selectleaveTypelist.length,
                        itemBuilder: (context, i) {
                          return Obx(() {
                            return GestureDetector(
                              onTap: () {
                                selectedLeaveIndex.value = i;
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: AppColors.TRANSPARENT,
                                    height: 46.w,
                                    margin: EdgeInsets.only(left: 20.w, right: 16.w),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(selectleaveTypelist[i].toString(),style: regularTextStyle(fontSize: 14,txtColor: selectedLeaveIndex==i ? AppColors.BLUE : AppColors.BLACK))),
                                  ),
                                  i==selectleaveTypelist.length-1 ? Container() : Container(
                                    height: 0.6.w,
                                    color: AppColors.DARK_GRAY,
                                  )
                                ],
                              ),
                            );
                          });
                        }),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 44.w,
                          decoration: BoxDecoration(
                            color: AppColors.BLUE,
                            borderRadius: BorderRadius.circular(5.w),
                          ),

                          child: Center(
                            child: Text(
                              AppStrings.select,
                              style: regularTextStyle(fontSize: 14,txtColor: AppColors.WHITE),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(11.w)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }



  goBack(){
    Get.back();
  }


  goToNotification(){
    Get.to(NotificationScreen());
  }


  goToAddLeaveScreen(){
    Get.to(AddLeaveScreen());
  }
}