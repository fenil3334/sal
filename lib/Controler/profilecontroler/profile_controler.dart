import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/View/notification/notification_screen.dart';

class ProfileControler extends GetxController{

  TextEditingController nameControler=TextEditingController();
  TextEditingController branchControler=TextEditingController();
  TextEditingController contactNumberControler=TextEditingController();
  TextEditingController addressControler=TextEditingController();
  TextEditingController employeCodeControler=TextEditingController();



  goBack(){
    Get.back();
  }


  goToNotification(){
    Get.to(NotificationScreen());
  }
}