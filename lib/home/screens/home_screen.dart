import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_bike_shopping_app/core/app_styles.dart';

import '../../core/app_colors.dart';
import '../../core/assets.dart';
import '../widgets/back_ground_shape_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card_item.dart';
import '../widgets/custom_category_widget.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/custom_slider_widget.dart';
import '../widgets/icon_selector_row.dart' hide BottomSlantedClipperWithRadiusNB;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.darkBlue,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(top: 200.h, child: BackgroundShape()),
          Positioned(
            top:70.h,
            left: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 30.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 180.h,
                child: Column(
                  children: [
                    CustomAppBar(),
                    24.verticalSpace,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            CustomSliderWidget(),
                            CustomCategoryWidget(),
                            CustomListView(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 0.w,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}




