import 'package:get/get.dart';
import 'package:salon_secret/Model/attendancemodel/attendance_model.dart';
import 'package:salon_secret/View/notification/notification_screen.dart';

class AttendanceControler extends GetxController{

  List<AttendanceModel> attendanceList=[];




  @override
  void onInit() {
    super.onInit();

    getAttandanceList();
  }


  getAttandanceList(){
    attendanceList.add(AttendanceModel('10', "SAT", 'HOLIDAY', '#EBE6F1', 0, true));
    attendanceList.add(AttendanceModel('09', "FRI", '', '', 3, false));
    attendanceList.add(AttendanceModel('08', "THU", '', '', 4, false));
    attendanceList.add(AttendanceModel('09', "WED", '', '', 3, false));
    attendanceList.add(AttendanceModel('07', "TUE", '', '', 2, false));
    attendanceList.add(AttendanceModel('06', "MON", '', '', 3, false));
    attendanceList.add(AttendanceModel('05', "SUN", 'WEEK OFF', '#F9ECD9', 0, true));
    attendanceList.add(AttendanceModel('04', "SAT", 'HOLIDAY', '#EBE6F1', 0, true));
  }


  goBack(){
    Get.back();
  }


  goToNotification(){
    Get.to(NotificationScreen());
  }
}