import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Controler/bookappointmentcontroler/book_appointment_controler.dart';
import 'package:salon_secret/widget/custom_widget.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Helper/my_behavior.dart';
import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/color.dart';
import '../../Config/Utils/images.dart';
import '../../Config/Utils/styles.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_text.dart';

class AddClientScreen extends StatelessWidget {
  AddClientScreen({Key? key}) : super(key: key);

  BookAppointmentControler controler=Get.put(BookAppointmentControler());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar.homeAppBar(
                title : AppStrings.add_client,
                onTapmenu :() {
                  controler.goBack();
                },
                onTapNotifi :() {
                  controler.goToNotification();
                },
                isbackicon: true),

            CustomWidget.verticleLine(),



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

                        CustomText.addclientedittext(AppStrings.client_name, controler.clientNameControler, 'Enter Client Name', TextInputType.name,<TextInputFormatter>[]),

                        SizedBox(height: 20.w),


                        CustomText.addclientedittext(AppStrings.primary_number, controler.primaryNumberControler, 'Enter Primary Number', TextInputType.number,<TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ]),

                        SizedBox(height: 20.w),



                        CustomText.addclientedittext(AppStrings.secondary_number, controler.secondaryNumberControler, 'Enter Secondary Number', TextInputType.number,<TextInputFormatter>[
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
                                      controler.selectGender.value=0;
                                    },
                                    child:  Row(
                                      children: [
                                        SizedBox(width: 14.w),
                                        Image.asset(controler.selectGender.value==0 ?RADIO_BUTTON_FILL : RADIO_BUTTON_UNFILL,width: 16.w,color: controler.selectGender.value==0 ? AppColors.BLUE : AppColors.DARK_GRAY,),
                                        SizedBox(width: 14.w),
                                        CustomText.textsizeSourceRegularColor(AppStrings.male, 14, controler.selectGender.value==0 ? AppColors.BLUE : AppColors.DARK_GRAY),
                                      ],
                                    )),
                              ),

                              Container(width: 1.w,color: AppColors.btn_bordder,height: 46.w),

                              Expanded(
                                child: GestureDetector(
                                    onTap: (){
                                      controler.selectGender.value=1;
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(width: 14.w),
                                        Image.asset(controler.selectGender.value==1 ?RADIO_BUTTON_FILL : RADIO_BUTTON_UNFILL,width: 16.w,color: controler.selectGender.value==1 ? AppColors.BLUE : AppColors.DARK_GRAY,),
                                        SizedBox(width: 11.w),
                                        CustomText.textsizeSourceRegularColor(AppStrings.female, 14, controler.selectGender.value==1 ? AppColors.BLUE : AppColors.DARK_GRAY),
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

            })

          ],
        ),
      ),
    );
  }
}
