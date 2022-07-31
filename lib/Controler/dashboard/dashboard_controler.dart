import 'package:get/get.dart';
import 'package:salon_secret/Config/Utils/app_string.dart';
import 'package:salon_secret/Model/dashboard/top_service_model.dart';
import 'package:salon_secret/Model/dashboard/upcoming_appointment_model.dart';
import 'package:salon_secret/View/addclient/add_client_screen.dart';
import 'package:salon_secret/View/notification/notification_screen.dart';

import '../../Config/Utils/images.dart';
import '../../Model/dashboard/home_list_model.dart';

class DashboardControler extends GetxController{

  RxList<TopServiceModel> topserviceList = RxList<TopServiceModel>([]);
  RxList<HomeListModel> homeMenuList = RxList<HomeListModel>([]);
  RxList<UpcomingAppointModel> upcomingAppointList = RxList<UpcomingAppointModel>([]);


  @override
  void onInit() {
    super.onInit();

    getHomeMenu();
    getTopServices();
    getAppointment();
  }



  getHomeMenu(){
    homeMenuList.add(HomeListModel('1', ATTENDANCE_ICON, AppStrings.attendance));
    homeMenuList.add(HomeListModel('2', APPOINTMENT_FILL, AppStrings.todays_appointment));
    homeMenuList.add(HomeListModel('3', INCENTIVE_ICON, AppStrings.my_incentive));
    homeMenuList.add(HomeListModel('4', TARGET_ICON, AppStrings.my_target));
    homeMenuList.add(HomeListModel('5', REPORT_FILL, AppStrings.reports));
    homeMenuList.add(HomeListModel('6', LEAVE_APPLY_ICON, AppStrings.leave_apply));
    homeMenuList.add(HomeListModel('7', ADD_CLIENT_ICON, AppStrings.add_client));
    homeMenuList.add(HomeListModel('8', ADD_CLIENT_ICON, AppStrings.assigned_call));
    homeMenuList.add(HomeListModel('9', CALL_HISTORY_ICON, AppStrings.call_history));
  }


  getTopServices(){
    topserviceList.add(TopServiceModel(AppStrings.hair_spa, HAIR_SPA_ICON));
    topserviceList.add(TopServiceModel(AppStrings.facial, FACIAL_ICON));
    topserviceList.add(TopServiceModel(AppStrings.nail_polish, NAIL_POLISH_ICON));
    topserviceList.add(TopServiceModel(AppStrings.manicure_pedicure, MANICURE_ICON));
    topserviceList.add(TopServiceModel(AppStrings.sheaving, SHEAVING_ICON));
    topserviceList.add(TopServiceModel(AppStrings.hair_cut, HAIR_CUT_ICON));
  }

  
  
  getAppointment(){
    upcomingAppointList.add(UpcomingAppointModel('08.00\n AM', 'Akshay Dhande', 'Hair cut & Hair Spa', '08:20 AM'));
    upcomingAppointList.add(UpcomingAppointModel('08.30\n AM', 'Pinkal Lad ', 'Hair cut & Hair Spa', '08:20 AM'));
    upcomingAppointList.add(UpcomingAppointModel('09.00\n AM', 'Akshay Dhande', 'Hair cut & Hair Spa', '08:20 AM'));
    upcomingAppointList.add(UpcomingAppointModel('09.30\n AM', 'Pinkal Lad ', 'Hair cut & Hair Spa', '08:20 AM'));
    upcomingAppointList.add(UpcomingAppointModel('10.00\n AM', 'Akshay Dhande', 'Hair cut & Hair Spa', '08:20 AM'));
    upcomingAppointList.add(UpcomingAppointModel('10.30\n AM', 'Pinkal Lad ', 'Hair cut & Hair Spa', '08:20 AM'));
    upcomingAppointList.add(UpcomingAppointModel('11.00\n AM', 'Akshay Dhande', 'Hair cut & Hair Spa', '08:20 AM'));
  }



  goToNotification(){
    Get.to(NotificationScreen());
  }


  goToAddClient(){
    Get.to(AddClientScreen());
  }
}