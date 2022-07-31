import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/profilecontroler/profile_controler.dart';

import '../../Config/Helper/my_behavior.dart';
import '../../Config/Utils/app_string.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_widget.dart';


double imagesize = 126.w;


class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  ProfileControler controler=Get.put(ProfileControler());

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body : Container(
                color: AppColors.BACKGROUND_COLOR,
                child: Column(
                  children: [

                    CustomAppBar.homeAppBar(
                        title : AppStrings.profile,
                        onTapmenu :() {
                          controler.goBack();
                        },
                        onTapNotifi :() {
                          controler.goToNotification();
                        },
                        isbackicon: true),

                    CustomWidget.verticleLine(),




                    Expanded(
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(left: 18.w, right: 18.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.w,
                                  ),
                                  profileImage(),

                                  SizedBox(
                                    height: 22.w,
                                  ),

                                 edittextView()
                                ],
                              ),
                            ),
                          ),
                        ))


                  ],
                ),
              ),
            )
        )
    );
  }



  Widget profileImage() {
    return SizedBox(
      width: imagesize,
      height: imagesize,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  MEN_IMG,
                  width: imagesize,
                  height: imagesize,
                  fit: BoxFit.cover,
                )
            ),
          ),

        /*  Obx((){
            return Positioned(
                right: 6.w,
                top: 6.w,
                child: controller.isEditable.value ?  GestureDetector(
                  onTap: (){
                    controller.showDailogBottom();
                  },
                  child: Image.asset(
                    CHANGE_PROFILE_IMAGE,
                    width: 32.w,
                  ),
                ) : Container() );
          })*/
        ],
      ),
    );
  }



  Widget edittextView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleTextview(AppStrings.name),
        edittext(controler.nameControler,'Enter Name', TextInputType.name,<TextInputFormatter>[],1),
        sizeboxSize(),



        titleTextview(AppStrings.branch),
        edittext(controler.branchControler,'Enter Branch', TextInputType.name,<TextInputFormatter>[],1),

        sizeboxSize(),

        titleTextview(AppStrings.contact_number),
        edittext(controler.contactNumberControler,'Enter Contact Number', TextInputType.number,<TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],1),
        sizeboxSize(),

        titleTextview(AppStrings.address),
        edittext(controler.addressControler,'Enter Address', TextInputType.emailAddress,<TextInputFormatter>[],3),
        sizeboxSize(),


        titleTextview(AppStrings.employee_code),
        edittext(controler.employeCodeControler,'Enter Employee Coe', TextInputType.text,<TextInputFormatter>[],1),
        SizedBox(height: 28.w)
      ],
    );
  }



  Widget sizeboxSize() {
    return SizedBox(
      height: 21.w,
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
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
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
