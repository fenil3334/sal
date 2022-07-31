
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/appointmentcontroler/appointment_controler.dart';
import 'package:salon_secret/View/appointments/cancelled_tab.dart';
import 'package:salon_secret/View/appointments/running_tab.dart';
import 'package:salon_secret/View/appointments/upcoming_tab.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/app_string.dart';
import '../../Config/Utils/color.dart';
import '../../widget/custom_appbar.dart';

class AppointmentsScreen extends StatefulWidget {
  AppointmentsScreen(this.currentOpenTab,{Key? key}) : super(key: key);

  int currentOpenTab;

  @override
  State<AppointmentsScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<AppointmentsScreen> with SingleTickerProviderStateMixin{
  late TabController tabcontroller;
  AppointmentControler controler=Get.put(AppointmentControler());

  @override
  void initState() {
    tabcontroller =  TabController(length: 3, vsync: this);
    super.initState();

    tabcontroller.animateTo(widget.currentOpenTab);
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColors.BACKGROUND_COLOR,
          child: Column(
            children: [
              CustomAppBar.homeAppBar(
                  title : AppStrings.appointments,
                  onTapmenu :() {
                    controler.goBack();
                  },
                  onTapNotifi :() {
                    controler.goToNotification();
                  },
              isbackicon: true),

              Container(
                width: double.infinity,
                height: 50.w,
                color: AppColors.WHITE,

                child: TabBar(
                  controller: tabcontroller,
                  labelColor: AppColors.BLUE,
                  unselectedLabelColor: AppColors.BLACK,
                  labelStyle: TextStyle(
                      fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),

                  unselectedLabelStyle: TextStyle(
                      fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
                  indicatorSize: TabBarIndicatorSize.tab,
                 // indicator: BoxDecoration(color: AppColors.BLUE),

                  tabs: <Widget>[
                    Text(AppStrings.running),
                    Text(AppStrings.upcoming),
                    Text(AppStrings.cancelled),
                  ],
                ),
              ),

              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left :0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: TabBarView(
                        controller: tabcontroller,
                        children: <Widget>[RunningTab(), UpcomingTab(),CancelledTab()],
                      ),
                    ),

                    Positioned(
                      right: 14.w,
                      bottom: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          WebsafeSvg.asset(ADD_APPOINTMENT,width: 52.w),

                          SizedBox(height: 14.w),


                          Obx((){
                            return Container(
                              width: 98.w,
                              height: 44.w,
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                color: AppColors.BLUE,
                                borderRadius: BorderRadius.circular(1.w),
                              ),
                              child: Row(
                                children: [
                                  Expanded(child: GestureDetector(
                                      onTap :(){
                                        controler.currentSelectMode.value=0;
                                      },
                                      child: selectSwitch(CALANDER_ICON,controler.currentSelectMode.value,0))),
                                  Expanded(child: GestureDetector(
                                      onTap:(){
                                        controler.currentSelectMode.value=1;
                            },
                                      child: selectSwitch(CALANDER_LIST_ICON,controler.currentSelectMode.value,1))),
                                ],
                              ),
                            );
                          })
                        ],
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget selectSwitch(String icon,int index,int menuIndex){
    return Expanded(
      child: Container(
        color: index==menuIndex ? AppColors.BLUE : AppColors.WHITE,
        child: Center(
          child: SizedBox(
              width: 20.w,
              child: WebsafeSvg.asset(icon,color: index==menuIndex ? AppColors.DARK_GRAY : AppColors.BLUE)),
        ),
      ),
    );
  }
}