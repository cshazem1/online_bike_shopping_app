import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_colors.dart';
import '../../core/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(right: 40.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bike Shop',
            style: AppStyles.appBarStyle,
          ),
           Container(
             height: 45.h,
             width: 45.w,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10.r),
               gradient: LinearGradient(
                 colors: [ AppColors.lightBlue1,AppColors.lightBlue,],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomCenter,
               ),
             ),
             child: Icon(
              CupertinoIcons.search,
              color: AppColors.white1,
              size: 30,
                     ),
           ),
        ],
      ),
    );
  }
}
