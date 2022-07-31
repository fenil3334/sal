import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/View/notification/notification_screen.dart';
import 'package:salon_secret/widget/custom_text.dart';
import 'package:salon_secret/widget/custom_widget.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Helper/my_behavior.dart';
import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/images.dart';

class BookAppointmentControler extends GetxController{

  TextEditingController clientNameControler=TextEditingController();
  TextEditingController primaryNumberControler=TextEditingController();
  TextEditingController secondaryNumberControler=TextEditingController();
  TextEditingController datebirthControler=TextEditingController();

  RxInt selectGender=0.obs;
  RxInt selectNameIndex=0.obs;
  RxInt selectClientTypeIndex=0.obs;


  List<String> namelist=[
    'Ramesh Oza', 'Narayan devraj','Chintan Patel','Rohit Shetty','Salim Nakun','Sagar Sanjeev'
  ];



  List<String> clientTypeList=[
    'Walk-in', 'Walk-in','Walk-in','Walk-in','Walk-in'
  ];




  showClientTypeDailog() {
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
                                  'Client Type', 20.sp, AppColors.BLACK),
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
                              CustomText.textField('Search client type',
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
                        itemCount: clientTypeList.length,
                        itemBuilder: (context, i) {
                          return Obx(() {
                            return GestureDetector(
                              onTap: () {
                                selectClientTypeIndex.value = i;
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
                                        child: Text(clientTypeList[i].toString(),style: regularTextStyle(fontSize: 14,txtColor: selectClientTypeIndex==i ? AppColors.BLUE : AppColors.BLACK))),
                                  ),
                                  i==clientTypeList.length-1 ? Container() : Container(
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


  addClientDailog(){
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
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
                height: Get.height-40.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 48.w,
                      child: Stack(
                        children: [
                          Align(
                              alignment :Alignment.center,
                              child: Text(AppStrings.add_client,style: mediumTextStyle(fontSize: 20,txtColor: AppColors.BLACK))
                          ),

                          Positioned(
                              right : 10.w,top: 0,bottom: 0,child: Center(child: GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(6.w),
                                child: Image.asset(CLOSE_ICON,height: 15.w,color: AppColors.BLACK),
                              ))))
                        ],
                      ),
                    ),

                    Container(height: 0.7.w,color: AppColors.SHIMMER_BASE,),


                    Expanded(child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(left: 18.w,right: 18.w),
                          child: Obx((){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(height: 14.w),

                                CustomText.addclientedittext(AppStrings.client_name, clientNameControler, 'Enter Client Name', TextInputType.name,<TextInputFormatter>[]),

                                SizedBox(height: 20.w),


                                CustomText.addclientedittext(AppStrings.primary_number, primaryNumberControler, 'Enter Primary Number', TextInputType.number,<TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ]),

                                SizedBox(height: 20.w),



                                CustomText.addclientedittext(AppStrings.secondary_number, secondaryNumberControler, 'Enter Secondary Number', TextInputType.number,<TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ]),

                                SizedBox(height: 20.w),


                                Text(AppStrings.gender,style: regularTextStyle(fontSize: 13,txtColor: AppColors.BLACK)),

                                SizedBox(height: 2.w),

                                Container(
                                  height: 46.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(width: 1.w, color: AppColors.btn_bordder),
                                      color: AppColors.WHITE),
                                  child:  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                            onTap: (){
                                              selectGender.value=0;
                                            },
                                            child:  Row(
                                              children: [
                                                SizedBox(width: 14.w),
                                                Image.asset(selectGender.value==0 ?RADIO_BUTTON_FILL : RADIO_BUTTON_UNFILL,width: 16.w,color: selectGender.value==0 ? AppColors.BLUE : AppColors.DARK_GRAY,),
                                                SizedBox(width: 14.w),
                                                CustomText.textsizeSourceRegularColor(AppStrings.male, 14, selectGender.value==0 ? AppColors.BLUE : AppColors.DARK_GRAY),
                                              ],
                                            )),
                                      ),

                                      Container(width: 1.w,color: AppColors.btn_bordder,height: 46.w),

                                      Expanded(
                                        child: GestureDetector(
                                            onTap: (){
                                              selectGender.value=1;
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(width: 14.w),
                                                Image.asset(selectGender.value==1 ?RADIO_BUTTON_FILL : RADIO_BUTTON_UNFILL,width: 16.w,color: selectGender.value==1 ? AppColors.BLUE : AppColors.DARK_GRAY,),
                                                SizedBox(width: 11.w),
                                                CustomText.textsizeSourceRegularColor(AppStrings.female, 14, selectGender.value==1 ? AppColors.BLUE : AppColors.DARK_GRAY),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),


                                SizedBox(height: 20.w),

                                Text(AppStrings.date_of_birth,style: regularTextStyle(fontSize: 13,txtColor: AppColors.BLACK)),

                                SizedBox(height: 2.w),


                                GestureDetector(
                                  onTap: (){

                                  },
                                  child: Container(
                                    height: 46.w,
                                    padding: EdgeInsets.only(left: 12.w,right: 9.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
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

                                        Expanded(child: Text('03/12/2022',style: mediumTextStyle(fontSize: 13,txtColor: AppColors.BLACK))),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            );
                          }),
                        ),
                      ),
                    )),

                    CustomWidget.blueBottomButton(AppStrings.add,() {
                      Get.back();
                    })

                  ],
                )
            ),
          );
        }
    );
  }




  goToNotification(){
    Get.to(NotificationScreen());
  }


  goBack(){
    Get.back();
  }
}