import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Controler/leavecontroler/leave_history_controler.dart';

import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/styles.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_widget.dart';

class AddLeaveScreen extends StatelessWidget {
  AddLeaveScreen({Key? key}) : super(key: key);

  LeaveHistoryControler controler=Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body : Column(
            children: [

              CustomAppBar.homeAppBar(
                  title : AppStrings.leave_apply,
                  onTapmenu :() {
                    controler.goBack();
                  },
                  onTapNotifi :() {
                    controler.goToNotification();
                  },
                  isbackicon: true),

              CustomWidget.verticleLine(),


              Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.w),

                          CustomText.bookAppointmentTitle(AppStrings.select_leave_type, 13, AppColors.BLACK),

                          SizedBox(height: 4.w),

                          Obx(() => CustomWidget.whiteRoundButton(controler.selectleaveTypelist[controler.selectedLeaveIndex.value].toString(), () {
                            controler.showSelectLeaveTypeDailog();
                          })),



                          SizedBox(height: 20.w),

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


                          SizedBox(height: 20.w),


                          titleTextview(AppStrings.reason),
                          edittext(controler.reasoncontroler,'Enter Reason', TextInputType.text,<TextInputFormatter>[],1),

                          SizedBox(height: 20.w),
                        ],
                      ),
                    ),
                  )
              ),


              CustomWidget.blueBottomButton(AppStrings.submit, () {
                controler.goBack();
              })

            ],
          ),
        ),
      ),
    );
  }




  Widget titleTextview(String title) {
    return Column(
      children: [
        Text(
          title,
          style: regularTextStyle(fontSize: 13,txtColor: AppColors.profile_txt_color),
        ),
        SizedBox(
          height: 4.w,
        )
      ],
    );
  }


  Widget edittext(TextEditingController editingController,String hint, TextInputType keyboardtype, List<TextInputFormatter> list,int maxline) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          border: Border.all(width: 1.w, color: AppColors.btn_bordder),
          color: AppColors.WHITE),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          cursorColor: Colors.black,
          controller: editingController,
          maxLines: maxline,
          inputFormatters: list,
          textInputAction: TextInputAction.next,
          style: regularTextStyle(fontSize: 14,txtColor: AppColors.BLACK),
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
              hintStyle: regularTextStyle(fontSize: 14,txtColor: AppColors.DARK_GRAY)
          ),
        ),
      ),
    );
  }

}
