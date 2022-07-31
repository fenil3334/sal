import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Controler/appointmentcontroler/appointment_controler.dart';

import '../../Config/Utils/color.dart';
import '../../Config/Utils/images.dart';
import '../../Config/Utils/styles.dart';
import '../../widget/custom_widget.dart';

class CancelledTab extends StatelessWidget {
  CancelledTab({Key? key}) : super(key: key);

  AppointmentControler controler=Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: canceledListView())
      ],
    );
  }



  Widget canceledListView() {
    return Obx(() => ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 24.w),
        physics: BouncingScrollPhysics(),
        itemCount: controler.canceledappointment.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(bottom: 18.w),
            decoration: BoxDecoration(
                color: AppColors.WHITE,
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(width: 1.w,color: AppColors.appointment_border)
            ),

            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 9.w,horizontal: 14.w),
                  child: Row(
                    children: [
                      Image.asset(ICON_STAR,width: 14.w),
                      SizedBox(width: 8.w),
                      Image.asset(ICON_MEDAL,width: 14.w,color: AppColors.GREEN),

                      Spacer(),
                      Text(controler.canceledappointment[i].status,style: regularTextStyle(fontSize: 13,txtColor: AppColors.RED))
                    ],
                  ),
                ),

                Container(
                  height: 1.w,
                  color: AppColors.appointment_border,
                ),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(controler.canceledappointment[i].name,style: mediumTextStyle(fontSize: 15,txtColor: AppColors.BLACK)),

                                SizedBox(width: 8.w),
                                Image.asset(ICON_INFO,color: AppColors.BLACK,width: 13.w)
                              ],
                            ),
                            SizedBox(height: 9.w),
                            CustomWidget.itemDes(ICON_INFO,controler.canceledappointment[i].infoMsg),
                            SizedBox(height: 6.w),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(ICON_VIEW_MORE,color: AppColors.RED,width: 11.w),
                                SizedBox(width: 7.w),
                                Expanded(
                                  child: ReadMoreText(
                                    controler.canceledappointment[i].canceledDes,
                                    trimLines: 1,
                                    style: regularTextStyle(txtColor: AppColors.BLACK, fontSize: 13),
                                    colorClickableText: AppColors.BLUE,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '...Read more',
                                    trimExpandedText: ' Less',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.w),
                            CustomWidget.itemDes(ICON_INFO,controler.canceledappointment[i].appointdescription),
                            SizedBox(height: 6.w),
                            CustomWidget.itemDes(ICON_EDIT,controler.canceledappointment[i].clientName),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Image.asset(TIME_ICON,width: 14.w,color: AppColors.BLUE),
                              SizedBox(width: 5.w),
                              Text(controler.canceledappointment[i].time,style: semiBoldTextStyle(fontSize: 14,txtColor: AppColors.BLUE))
                            ],
                          ),

                          Text(controler.canceledappointment[i].date,style: mediumTextStyle(fontSize: 10,txtColor: AppColors.BLACK)),


                          SizedBox(height: 30.w),


                          Text('₹'+controler.canceledappointment[i].amount,style: mediumTextStyle(fontSize: 17,txtColor: AppColors.BLACK))

                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
