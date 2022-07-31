import 'package:get/get.dart';
import 'package:salon_secret/View/bookappointments/add_book_appointment_screen.dart';

class HomeScreenControler extends GetxController{
  RxInt pageIndex = 0.obs;


  goToBookAppointment(){
    Get.to(AddBookAppointmentScreen());
  }
}