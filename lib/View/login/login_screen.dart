import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/app_string.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/logincontroler/login_controler.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/images.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginControler controler=Get.put(LoginControler());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            color: AppColors.BACKGROUND_COLOR,
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [

                Expanded(
                    child: emailPassword()
                ),

                loginButton(),

                SizedBox(
                  height: 30.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }




  Widget emailPassword(){
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: Text(
                      AppStrings.login,
                      style: mediumTextStyle(fontSize: 29,txtColor: AppColors.BLACK),
                    ),
                  ),


                  SizedBox(
                    height: 12.w,
                  ),

                  Center(
                    child: Text(
                      AppStrings.enter_emailid_password,
                      style: regularTextStyle(fontSize: 20,txtColor: AppColors.BLACK),
                    ),
                  ),

                  SizedBox(
                    height: 6.w,
                  ),

                  Center(
                    child: Text(
                      AppStrings.please_confirm_your_email,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: lightTextStyle(fontSize: 13,txtColor: AppColors.LIGHT_GREY),
                    ),
                  ),


                  SizedBox(
                    height: 34.w,
                  ),



                  Text(
                    AppStrings.email_address,
                    style: lightTextStyle(fontSize: 14,txtColor: AppColors.LIGHT_GREY),
                  ),

                  Row(
                    children: [

                      WebsafeSvg.asset(ICON_EMAIL,width: 17.w,height:17.w,color: AppColors.LOGIN_ICON_COLOR,fit: BoxFit.fill),

                      SizedBox(width: 12.w,),

                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: regularTextStyle(fontSize: 15,txtColor: AppColors.BLACK),

                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10.w),
                            isDense: true,
                            hintText: AppStrings.enter_your_emailid,
                            labelStyle: regularTextStyle(fontSize: 15,txtColor: AppColors.LIGHT_GREY),
                          ),

                        ),
                      ),
                    ],
                  ),

                  edittextBorder(),


                  SizedBox(
                    height: 26.w,
                  ),



                  Text(
                    AppStrings.password,
                    style: lightTextStyle(fontSize: 14,txtColor: AppColors.LIGHT_GREY),
                  ),

                  Row(
                    children: [

                      WebsafeSvg.asset(ICON_PASSWORD,width: 17.w,height:17.w,color: AppColors.LOGIN_ICON_COLOR,fit: BoxFit.fill),

                      SizedBox(width: 12.w,),

                      Expanded(
                        child: TextField(
                          obscureText: true,
                          style: regularTextStyle(fontSize: 15,txtColor: AppColors.BLACK),
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10.w),
                            isDense: true,
                            hintText: AppStrings.enter_your_password,
                            labelStyle: regularTextStyle(fontSize: 15,txtColor: AppColors.LIGHT_GREY),
                          ),

                        ),
                      ),
                    ],
                  ),

                  edittextBorder(),

                  /* TextField(
              style: regularTextStyle(fontSize: 14.sp,txtColor: AppColors.BLACK),
             decoration:  InputDecoration(
               prefixIcon: WebsafeSvg.asset(ICON_EMAIL,width: 18,color: AppColors.BLACK),
                hintText: AppStrings.enter_your_emailid,
                labelStyle: regularTextStyle(fontSize: 14.sp,txtColor: AppColors.LIGHT_GREY),
            ),
             *//* decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.people),
                  hintText: "Enter Your Name",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)))*//*
          ),
*/


                ],
              ),
            ),
          ),
        );
      },
    );
  }



  Widget edittextBorder(){
    return Container(
      width: double.infinity,
      height: 1.w,
      color: AppColors.textfield_border_color,
    );
  }


  Widget loginButton(){
    return GestureDetector(
      onTap: (){
        controler.goToHomeScreen();
      },
      child: Container(
        height: 47.w,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.BLUE,
          borderRadius: BorderRadius.circular(8.w),
        ),

        child: Center(
          child: Text(
            AppStrings.login,
            style: regularTextStyle(fontSize: 19,txtColor: AppColors.WHITE),
          ),
        ),
      ),
    );
  }
}
