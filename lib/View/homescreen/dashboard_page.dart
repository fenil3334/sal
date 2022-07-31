import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Helper/my_behavior.dart';
import 'package:salon_secret/Config/Utils/app_string.dart';
import 'package:salon_secret/Config/Utils/color.dart';
import 'package:salon_secret/Config/Utils/styles.dart';
import 'package:salon_secret/Controler/dashboard/dashboard_controler.dart';
import 'package:salon_secret/widget/custom_appbar.dart';
import 'package:salon_secret/widget/custom_widget.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../Config/Utils/images.dart';
import '../../Controler/homescreencontroler/home_screen_controler.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  DashboardControler controler = Get.put(DashboardControler());
  HomeScreenControler homescreencontroler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColors.BACKGROUND_COLOR,
          child: Column(
            children: [
              CustomAppBar.homeAppBar(
                title : AppStrings.dashboard,
                  onTapmenu :() {
                    homescreencontroler.pageIndex.value=3;
                  },
                  onTapNotifi :() {
                  controler.goToNotification();
                  }),
              CustomWidget.verticleLine(),
              Expanded(
                  child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: footerView(),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }



  Widget footerView() {
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.w),
              Container(
                height: 40.w,
                margin: EdgeInsets.symmetric(horizontal: 54.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: AppColors.BLUE,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WebsafeSvg.asset(ATTENDANCE_ICON,
                        color: AppColors.WHITE, height: 18.w),
                    SizedBox(width: 8.w),
                    Text(AppStrings.add_attendance,
                        style: regularTextStyle(
                            txtColor: AppColors.WHITE, fontSize: 16))
                  ]
                ),
              ),
              SizedBox(height: 16.w),
              CustomWidget.verticleLine(),

              SizedBox(height: 16.w),

              menuListWidget(),

              SizedBox(height: 24.w),

              menuTitle(AppStrings.top_service),
              SizedBox(height: 9.w),
              CustomWidget.verticleLine(),
              SizedBox(height: 11.w),
            ],
          ),
        ),


        topServiceList(),


        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 24.w),

              menuTitle(AppStrings.upcoming_appointment),
              SizedBox(height: 9.w),
              CustomWidget.verticleLine(),
              SizedBox(height: 11.w),
            ],
          ),
        ),
        
        
        
        Container(
          width: double.infinity,
          height: 54.w,
          padding: EdgeInsets.only(left: 16.w),
          decoration: BoxDecoration(
            color: AppColors.WHITE,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppColors.SHIMMER_BASE,
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 0.75)
              )
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('15',style: regularTextStyle(fontSize: 22,txtColor: AppColors.GREEN)),
              Text('SUN',style: regularTextStyle(fontSize: 12,txtColor: AppColors.GREEN)),
            ],
          ),
        ),

        appointmentListView(),
        SizedBox(height: 20.w),
      ],
    );
  }

  Widget menuTitle(String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(title,
          style: regularTextStyle(fontSize: 20, txtColor: AppColors.BLACK)),
    );
  }

  Widget menuListWidget() {
    return Obx(() {
      return GridView.builder(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        itemCount: controler.homeMenuList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 28.w,
            mainAxisSpacing: 17.w,
            childAspectRatio: 2 / 2.3),
        itemBuilder: (BuildContext context, int i) {
          return GestureDetector(
              onTap: () {
                if(controler.homeMenuList[i].id.toString()=="7"){
                  controler.goToAddClient();
                }
                // homePageControler.goToProductDetail();
              },
              child: Column(children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.w),
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.WHITE,
                            borderRadius:BorderRadius.circular(4.w),
                            border: Border.all(
                                width: 1.w,
                                color: AppColors.card_border_color)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: WebsafeSvg.asset(
                              controler.homeMenuList[i].image,
                              width: 26.w,
                            )),
                            SizedBox(
                              height: 8.w,
                            ),
                            Container(
                              height: 24.w,
                              child: Center(
                                child: Text(
                                  controler.homeMenuList[i].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: regularTextStyle(fontSize: 10,txtColor: AppColors.BLACK),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ]));
        },
      );
    });
  }

 Widget topServiceList(){
    return Obx(() => SizedBox(
      height: 90.w,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 16.w),
          scrollDirection: Axis.horizontal,
          itemCount: controler.topserviceList.length,
          itemBuilder: (context,i){
            return Container(
              margin: EdgeInsets.only(right: 16.w),
              width: 50.w,
              child: Column(
                children: [

                  Container(
                    height: 52.w,
                    width: 52.w,
                    decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        border: Border.all(width: 0.8.w,color: AppColors.BLUE),
                        borderRadius: BorderRadius.circular(100)
                    ),

                    child: Center(child: WebsafeSvg.asset(controler.topserviceList[i].image,width: 25.w,height: 25.w)),
                  ),

                  SizedBox(height: 5.w),

                  Text(controler.topserviceList[i].title.toString(),
                      textAlign: TextAlign.center,
                      style: regularTextStyle(txtColor: AppColors.BLACK,fontSize: 10))
                ],
              ),
            );
          }
      ),
    ));
  }


  Widget appointmentListView(){
    return Obx(() => ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controler.upcomingAppointList.length,
      itemBuilder: (context,i){
        return SizedBox(
          height: 86.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56.w,
                color: AppColors.WHITE,
                child: Center(
                  child: Text(controler.upcomingAppointList[i].time, textAlign : TextAlign.center,style: regularTextStyle(fontSize: 13,txtColor: AppColors.BLACK)),
                ),
              ),

              SizedBox(width: 30.w),

              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left :0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          height: 1.5.w,
                          color: AppColors.upcoming_line_color,
                        ),
                      ),
                    ),


                    Positioned(
                      left: 18.w,
                      right: 12.w,
                      top: 7.w,
                      bottom: 7.w,
                      child: Container(
                        padding: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(8.w),
                        ),

                        child: Row(
                          children: [
                            SizedBox(width: 6.w),
                            Center(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'Upcoming',
                                  style: regularTextStyle(fontSize: 9,txtColor: AppColors.WHITE),
                                ),
                              ),
                            ),

                            SizedBox(width: 6.w),
                            Container(
                              width: 0.6.w,
                              color: AppColors.WHITE,
                            ),

                            SizedBox(width: 11.w),


                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.w,bottom: 11.w),
                                child: Row(
                                  children: [
                                    Expanded(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controler.upcomingAppointList[i].name,style: mediumTextStyle(fontSize: 13,txtColor: AppColors.WHITE)),
                                        Text(controler.upcomingAppointList[i].serviceName,style: lightTextStyle(fontSize: 10,txtColor: AppColors.WHITE)),

                                        Spacer(),

                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Image.asset(ICON_INFO,width: 11.w,color: AppColors.WHITE),
                                                    SizedBox(width: 2.w),
                                                    Expanded(child: Text('FHE 13243', maxLines:1,overflow:TextOverflow.ellipsis,style: lightTextStyle(fontSize: 10,txtColor: AppColors.WHITE))),
                                                  ],
                                                ),
                                              ),

                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Image.asset(ICON_EDIT,width: 11.w,color: AppColors.WHITE),
                                                    SizedBox(width: 2.w),
                                                    Expanded(child: Text('Hardik Mangukiya',maxLines:1,overflow:TextOverflow.ellipsis,style: lightTextStyle(fontSize: 10,txtColor: AppColors.WHITE))),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(TIME_ICON,width: 12.w,color: AppColors.WHITE),
                                            SizedBox(width: 5.w),
                                            Text(controler.upcomingAppointList[i].appointTime,style: mediumTextStyle(fontSize: 11,txtColor: AppColors.WHITE))
                                          ],
                                        ),

                                        Spacer(),

                                        WebsafeSvg.asset(CALL_ICON,width: 26.w),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )


                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    ));
  }

}
