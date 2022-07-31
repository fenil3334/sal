import 'package:get/get.dart';
import 'package:salon_secret/Config/Utils/app_string.dart';
import 'package:salon_secret/View/appointments/running_appointment_screen.dart';
import 'package:salon_secret/View/notification/notification_screen.dart';

import '../../Model/appointmentmodel/running_appointment_model.dart';

class AppointmentControler extends GetxController{
  RxList<RunningAppointmentModel> runningappointment=RxList([]);
  RxList<RunningAppointmentModel> upcomingappointment=RxList([]);
  RxList<RunningAppointmentModel> canceledappointment=RxList([]);


  RxInt currentSelectMode=1.obs;

  
  @override
  void onInit() {
    super.onInit();
    
    getRunningAppointment();
    getUpcomingAppointment();
    getCancelledAppointment();
  }
  
  
  
  getRunningAppointment(){
    runningappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.running, '10:54 AM', 'Fri 15 Jul, 2022', '300', ''));
    runningappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.running, '10:54 AM', 'Fri 15 Jul, 2022', '400', ''));
    runningappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.running, '10:54 AM', 'Fri 15 Jul, 2022', '500', ''));
    runningappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.running, '10:54 AM', 'Fri 15 Jul, 2022', '600', ''));
    runningappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.running, '10:54 AM', 'Fri 15 Jul, 2022', '700', ''));
    runningappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.running, '10:54 AM', 'Fri 15 Jul, 2022', '800', ''));
    runningappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.running, '10:54 AM', 'Fri 15 Jul, 2022', '900', ''));
  }



  getUpcomingAppointment(){
    upcomingappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.upcoming, '10:54 AM', 'Fri 15 Jul, 2022', '300', ''));
    upcomingappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.upcoming, '10:54 AM', 'Fri 15 Jul, 2022', '400', ''));
    upcomingappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.upcoming, '10:54 AM', 'Fri 15 Jul, 2022', '500', ''));
    upcomingappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.upcoming, '10:54 AM', 'Fri 15 Jul, 2022', '600', ''));
    upcomingappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.upcoming, '10:54 AM', 'Fri 15 Jul, 2022', '700', ''));
    upcomingappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.upcoming, '10:54 AM', 'Fri 15 Jul, 2022', '800', ''));
    upcomingappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.upcoming, '10:54 AM', 'Fri 15 Jul, 2022', '900', ''));
  }

  getCancelledAppointment(){
    canceledappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.cancelled, '10:54 AM', 'Fri 15 Jul, 2022', '300', 'Health not well, schedule on 29 sptember 2022, Health not well, schedule on 29 sptember 2022'));
    canceledappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.cancelled, '10:54 AM', 'Fri 15 Jul, 2022', '400', 'Health not well, schedule on 29 sptember 2022, Health not well, schedule on 29 sptember 2022'));
    canceledappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.cancelled, '10:54 AM', 'Fri 15 Jul, 2022', '500', 'Health not well, schedule on 29 sptember 2022, Health not well, schedule on 29 sptember 2022'));
    canceledappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.cancelled, '10:54 AM', 'Fri 15 Jul, 2022', '600', 'Health not well, schedule on 29 sptember 2022, Health not well, schedule on 29 sptember 2022'));
    canceledappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.cancelled, '10:54 AM', 'Fri 15 Jul, 2022', '700', 'Health not well, schedule on 29 sptember 2022, Health not well, schedule on 29 sptember 2022'));
    canceledappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.cancelled, '10:54 AM', 'Fri 15 Jul, 2022', '800', 'Health not well, schedule on 29 sptember 2022, Health not well, schedule on 29 sptember 2022'));
    canceledappointment.add(RunningAppointmentModel('Akshay Dhande', 'FSGF-TM254', "Add on Bond Multiplayer", 'Hardik Mangukiya', AppStrings.cancelled, '10:54 AM', 'Fri 15 Jul, 2022', '900', 'Health not well, schedule on 29 sptember 2022, Health not well, schedule on 29 sptember 2022'));
  }



  goToNotification(){
    Get.to(NotificationScreen());
  }

  goToRunningAppointmentDetail(){
    Get.to(RunningAppointmentScreen());
  }

  goBack(){
    Get.back();
  }
}