import 'package:get/get.dart';
import 'package:salon_secret/Config/Utils/app_string.dart';
import 'package:salon_secret/Config/Utils/images.dart';
import 'package:salon_secret/View/attendance/attendance_detail_screen.dart';
import 'package:salon_secret/View/leave/leave_history_screen.dart';
import 'package:salon_secret/View/notification/notification_screen.dart';
import 'package:salon_secret/View/profile/edit_profile_screen.dart';
import 'package:salon_secret/View/workhistory/work_history_screen.dart';

import '../../Model/dashboard/home_list_model.dart';

class SettingControler extends GetxController{
  RxList<HomeListModel> settingList=RxList([]);
  
  @override
  void onInit() {
    super.onInit();
    
    getMenuList();
  }
  
  
  
  getMenuList(){
    settingList.add(HomeListModel('1', ICON_NOTIFICATION, AppStrings.notification));
    settingList.add(HomeListModel('2', APPOINTMENT_UNFILL, AppStrings.appointments));
    settingList.add(HomeListModel('3', ICON_NOTIFICATION, AppStrings.work_history));
    settingList.add(HomeListModel('4', REPORT_UNFILL, AppStrings.reports));
    settingList.add(HomeListModel('5', ATTENDANCE_ICON, AppStrings.attendance));
    settingList.add(HomeListModel('6', LEAVE_APPLY_ICON, AppStrings.leave_apply));
    settingList.add(HomeListModel('7', LOGOUT_ICON, AppStrings.logout));
  }


  goToNotification(){
    Get.to(NotificationScreen());
  }


  goToEditProfile(){
    Get.to(EditProfileScreen());
  }

  goToLeaveHistory() {
    Get.to(LeaveHistoryScreen());
  }

  goToWorkHistory(){
    Get.to(WorkHistoryScreen());
  }

  goToAttendanceDetail(){
    Get.to(AttendanceDetailScreen());
  }
}