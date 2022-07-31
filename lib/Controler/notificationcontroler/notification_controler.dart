import 'package:get/get.dart';

import '../../Model/notificationmodel/notification_model.dart';

class NotificationControler extends GetxController{
  RxList<NotificationModel> notificationlist=RxList([]);

  @override
  void onInit() {
    super.onInit();

    getNotifiations();
  }


  getNotifiations(){
    notificationlist.add(NotificationModel('Service Complete!','Your service has been completed','02:30 PM'));
    notificationlist.add(NotificationModel('2 more people in Quene','You have 2 more people on today for hair cut services.','05:30 PM'));
    notificationlist.add(NotificationModel('Appointment is not booked!','Your booking is successfully','11:15 AM'));
    notificationlist.add(NotificationModel('Service Complete!','Your service has been completed','02:30 PM'));
    notificationlist.add(NotificationModel('2 more people in Quene','You have 2 more people on today for hair cut services.','05:30 PM'));
    notificationlist.add(NotificationModel('Appointment is not booked!','Your booking is successfully','11:15 AM'));
  }


  goBack(){
    Get.back();
  }
}