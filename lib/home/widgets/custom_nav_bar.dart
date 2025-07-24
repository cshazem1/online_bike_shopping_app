import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_colors.dart';
import 'icon_selector_row.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 105.h,
      child: Stack(
        children: [
          ClipPath(
            clipper: BottomSlantedClipperWithRadiusNB(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 105.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(3.14),
                  colors: [AppColors.darkBlueCard2, AppColors.lightBlueCard],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          IconSelectorRow(),
        ],
      ),
    );
  }
}
