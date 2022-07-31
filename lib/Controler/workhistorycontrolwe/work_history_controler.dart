import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Model/workhistorymodel/work_history_model.dart';
import 'package:salon_secret/View/notification/notification_screen.dart';
import 'package:salon_secret/View/workhistory/work_history_screen.dart';

import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/color.dart';
import '../../Config/Utils/images.dart';
import '../../Config/Utils/styles.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_widget.dart';

class WorkHistoryControler extends GetxController{

  List<WorkHistoryModel> historylist=[];
  List<String> statusList=['Completed','Cancelled'];
  List<String> namelist=[
    'Ramesh Oza', 'Narayan devraj','Chintan Patel','Rohit Shetty','Salim Nakun','Sagar Sanjeev'
  ];

  RxInt selectStatusIndex=0.obs;
  RxInt selectNameIndex=0.obs;



  @override
  void onInit() {
    super.onInit();

    getHistory();
  }


  
  
  getHistory(){
    historylist.add(WorkHistoryModel('Akshay Dhande', 'Fri 15 Jul, 2022', '10:45 AM - 12:15 PM', 'FSHB-SG124', 'Add on Bond Multiplayer', 'Hardik Mangukiya', 'Cancelled', '300'));
    historylist.add(WorkHistoryModel('Akshay Dhande', 'Fri 15 Jul, 2022', '10:45 AM - 12:15 PM', 'FSHB-SG124', 'Add on Bond Multiplayer', 'Hardik Mangukiya', 'Cancelled', '300'));
    historylist.add(WorkHistoryModel('Akshay Dhande', 'Fri 15 Jul, 2022', '10:45 AM - 12:15 PM', 'FSHB-SG124', 'Add on Bond Multiplayer', 'Hardik Mangukiya', 'Completed', '300'));
    historylist.add(WorkHistoryModel('Akshay Dhande', 'Fri 15 Jul, 2022', '10:45 AM - 12:15 PM', 'FSHB-SG124', 'Add on Bond Multiplayer', 'Hardik Mangukiya', 'Completed', '300'));
    historylist.add(WorkHistoryModel('Akshay Dhande', 'Fri 15 Jul, 2022', '10:45 AM - 12:15 PM', 'FSHB-SG124', 'Add on Bond Multiplayer', 'Hardik Mangukiya', 'Cancelled', '300'));
    historylist.add(WorkHistoryModel('Akshay Dhande', 'Fri 15 Jul, 2022', '10:45 AM - 12:15 PM', 'FSHB-SG124', 'Add on Bond Multiplayer', 'Hardik Mangukiya', 'Completed', '300'));
    historylist.add(WorkHistoryModel('Akshay Dhande', 'Fri 15 Jul, 2022', '10:45 AM - 12:15 PM', 'FSHB-SG124', 'Add on Bond Multiplayer', 'Hardik Mangukiya', 'Cancelled', '300'));
    historylist.add(WorkHistoryModel('Akshay Dhande', 'Fri 15 Jul, 2022', '10:45 AM - 12:15 PM', 'FSHB-SG124', 'Add on Bond Multiplayer', 'Hardik Mangukiya', 'Completed', '300'));
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

                    CustomText.bookAppointmentTitle(AppStrings.select_name_number, 13, AppColors.BLACK),

                    SizedBox(height: 4.w),

                    Obx((){
                      return  CustomWidget.whiteRoundButton(namelist[selectNameIndex.value].toString(), () {
                        showClientNameDailog();
                      });
                    }),







                    SizedBox(height: 24.w),

                    CustomText.bookAppointmentTitle(AppStrings.appointment_status, 13, AppColors.BLACK),

                    SizedBox(height: 4.w),

                    Obx((){
                      return  CustomWidget.whiteRoundButton(statusList[selectStatusIndex.value].toString(), () {
                        showAppointmentStatusDailog();
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






  showClientNameDailog() {
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
            height: 400.w,

            padding: EdgeInsets.symmetric(vertical: 14.w),
            child: Material(
              child: Container(
                color: AppColors.WHITE,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 12.w,bottom: 6.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText.textsizeSourceRegularColor(
                                  'Client Name', 20.sp, AppColors.BLACK),
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
                          SizedBox(
                            height: 15.w,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                SEARCH_ICON,
                                width: 16.w,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              CustomText.textField('Search client name',
                                      (value) {
                                    //controler.dealerSearch(value!);
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 8.w,
                    ),

                    Container(
                      height: 0.6.w,
                      color: AppColors.DARK_GRAY,
                    ),

                    Expanded(child:  ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: namelist.length,
                        itemBuilder: (context, i) {
                          return Obx(() {
                            return GestureDetector(
                              onTap: () {
                                selectNameIndex.value = i;
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
                                        child: Text(namelist[i].toString(),style: regularTextStyle(fontSize: 14,txtColor: selectNameIndex==i ? AppColors.BLUE : AppColors.BLACK))),
                                  ),
                                  i==namelist.length-1 ? Container() : Container(
                                    height: 0.6.w,
                                    color: AppColors.DARK_GRAY,
                                  )
                                ],
                              ),
                            );
                          });
                        })),

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



  showAppointmentStatusDailog() {
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
                                  'Appointment Status', 20.sp, AppColors.BLACK),
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
                        itemCount: statusList.length,
                        itemBuilder: (context, i) {
                          return Obx(() {
                            return GestureDetector(
                              onTap: () {
                                selectStatusIndex.value = i;
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
                                        child: Text(statusList[i].toString(),style: regularTextStyle(fontSize: 14,txtColor: selectStatusIndex==i ? AppColors.BLUE : AppColors.BLACK))),
                                  ),
                                  i==statusList.length-1 ? Container() : Container(
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
}