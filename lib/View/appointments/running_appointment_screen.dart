import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Helper/my_behavior.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/widget/custom_widget.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/images.dart';
import '../../Controler/appointmentcontroler/appointment_controler.dart';
import '../../widget/custom_appbar.dart';

class RunningAppointmentScreen extends StatelessWidget {
  RunningAppointmentScreen({Key? key}) : super(key: key);

  AppointmentControler controler=Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColors.BACKGROUND_COLOR,
          child: Column(
            children: [

              CustomAppBar.homeAppBar(
                  title : 'FSHB-JK123',
                  onTapmenu :() {
                    controler.goBack();
                  },
                  onTapNotifi :() {
                    controler.goToNotification();
                  },
                  isbackicon: true),

              CustomWidget.verticleLine(),



              Expanded(child: Column(
                children: [
                  SizedBox(
                    height: 48.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Text("Akshat Dhande",style: mediumTextStyle(fontSize: 20.w,txtColor: AppColors.BLUE)),
                        ],
                      ),
                    ),
                  ),


                  CustomWidget.verticleLine(),


                  appointmentInfo(),


                  CustomWidget.verticleLine(),


                  addConsumptionButton(),


                  Container(
                    height: 36.w,
                    decoration: BoxDecoration(
                      color: AppColors.WHITE,
                      border: Border(top: BorderSide(color: AppColors.card_border_color, width: 0.8.w)),
                    ),
                    child: Center(
                      child: Text(AppStrings.consumption_during_service,style: regularTextStyle(fontSize: 12,txtColor: AppColors.BLUE)),
                    ),
                  ),



                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          width: 598.w,
                          child: Column(
                            children: [

                              Container(
                                height: 56.w,
                                decoration: BoxDecoration(
                                  border: Border(top: BorderSide(color: AppColors.DARK_GRAY,width: 0.7.w),bottom: BorderSide(color: AppColors.DARK_GRAY,width: 0.7.w)),
                                  color: AppColors.WHITE,
                                ),

                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Row(
                                      children: [

                                        headerLayout(130.w, 'Product'),
                                        headerLayout(78.w, 'Current Stock'),
                                        headerLayout(92.w, 'Consumed'),
                                        headerLayout(74.w, 'Volume Binded'),
                                        headerLayout(90.w, 'Difference'),
                                        headerLayout(130.w, 'Description'),
                                      ],
                                    )
                                  ],
                                ),
                              ),


                              Expanded(child: listView())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),


                  startCompleteButton()

                ],
              ))




            ],
          ),
        ),
      ),
    );
  }



  Widget listView(){
    return ListView.builder(
        itemCount: 9,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context,i){
          return SizedBox(
            height: 40.w,
            child: Expanded(
              child: Row(
                children: [
                  listItemText(130.w, 'Acetone 400 ML'),
                  listItemText(78.w, '3'),
                  listItemText(92.w, '1'),
                  listItemText(74.w, '50'),
                  listItemText(90.w, '49'),
                  listItemText(130.w, 'Lorem ipsume'),
                ],
              ),
            ),
          );
        }
    );
  }



  Widget headerLayout(double size,String title){
    return Row(
      children: [
        Container(
          width: size,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Center(
            child: Text(
              title,
              style: mediumTextStyle(fontSize: 13,txtColor: AppColors.BLACK),
            ),
          ),
        ),

        Container(width: 0.6.w,color: AppColors.DARK_GRAY)
      ],
    );
  }


  Widget listItemText(double size,String title){
    return Row(
      children: [
        Container(
          width: size,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: regularTextStyle(fontSize: 12,txtColor: AppColors.BLACK),
          ),
        ),

        Container(width: 0.6.w,color: AppColors.DARK_GRAY)
      ],
    );
  }



  Widget appointmentInfo(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Image.asset(ICON_STAR,width: 20.w),
              SizedBox(width: 12.w),
              Image.asset(ICON_MEDAL,width: 20.w,color: AppColors.GREEN),
            ],
          ),

          SizedBox(height: 12.w),
          Row(
            children: [
              WebsafeSvg.asset(APPOINTMENT_UNFILL,color: AppColors.BLACK,width: 16.w),
              SizedBox(width: 12.w),
              Text('Fri 15 Jul, 2022',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: mediumTextStyle(fontSize: 13,txtColor: AppColors.BLACK)),

            ],
          ),

          SizedBox(height: 10.w),

          CustomWidget.appointDetailitemInfo(TIME_ICON,'10:54 AM - 12:15 PM'),
          SizedBox(height: 8.w),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: CustomWidget.appointDetailitemInfo(ICON_INFO,'Add on Bond Multiplayer(Color)')),
              
              Text("₹.300.0",style: semiBoldTextStyle(fontSize: 18,txtColor: AppColors.BLACK))
            ],
          ),
          SizedBox(height: 8.w),
          CustomWidget.appointDetailitemInfo(ICON_EDIT,'Hardik Mangukiya'),
        ],
      ),
    );
  }


  Widget addConsumptionButton(){
    return Container(
      height: 42.w,
      margin: EdgeInsets.symmetric(horizontal: 54.w,vertical: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: AppColors.WHITE,
        border: Border.all(width: 1.w,color: AppColors.BLUE),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 2,
            color: AppColors.SHIMMER_BASE,
          ),
        ],
      ),


      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ADD_ROUNDED_ICON,color: AppColors.BLUE,width: 20.w),
          SizedBox(width: 8.w),
          Text(AppStrings.add_consumption,style: regularTextStyle(fontSize: 14,txtColor: AppColors.BLUE))
        ],
      ),
    );
  }




  Widget startCompleteButton(){
    return Column(
      children: [
        SizedBox(
          height: 40.w,
          child: Row(
            children: [
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(TIME_ICON,width: 18.w,color: AppColors.GREEN),
                  SizedBox(width: 10.w),
                  Text('03:25 PM',style: regularTextStyle(fontSize: 14,txtColor: AppColors.GREEN))
                ],
              )),

              Container(width: 0.8.w,color: AppColors.DARK_GRAY),

              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(TIME_ICON,width: 18.w,color: AppColors.RED),
                  SizedBox(width: 10.w),
                  Text('03:25 PM',style: regularTextStyle(fontSize: 14,txtColor: AppColors.RED))
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }
}
