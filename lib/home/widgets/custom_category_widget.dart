import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_colors.dart';
import '../../core/app_styles.dart';
import '../../core/assets.dart';

class CustomCategoryWidget extends StatefulWidget {
  const CustomCategoryWidget({super.key});

  @override
  State<CustomCategoryWidget> createState() => _CustomCategoryWidgetState();
}
class _CustomCategoryWidgetState extends State<CustomCategoryWidget> {
  int selectedIndex = 0;

  final List<SvgPicture> icons = [
    SvgPicture.asset(Assets.all, color: AppColors.grey,),
    SvgPicture.asset(Assets.battery),
    SvgPicture.asset(Assets.road),
    SvgPicture.asset(Assets.tools),
    SvgPicture.asset(Assets.safety),
  ];

  final List<String> labels = [
    "All",
    "Battery",
    "Road",
    "Tools",
    "Safety",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: List.generate(icons.length, (index) {
          double leftOffset = 20.0.w + index * 70;
          double topOffset = 70.0.h - index * 18;

          bool isSelected = selectedIndex == index;
          bool isFirstGroup = (index ~/ 3) % 2 == 0;

          return Positioned(
            left: leftOffset,
            top: topOffset,
            child: GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: isSelected
                      ?Border.all(width: 2, color: AppColors.lightBlue):Border.all(width: 2, color: AppColors.border),
                  borderRadius: BorderRadius.circular(16),
                  gradient: isSelected
                      ? LinearGradient(
                    colors: [AppColors.lightBlue2, AppColors.lightBlue],
                  )
                      : LinearGradient(
                    colors: isFirstGroup
                        ? [AppColors.darkBlueCard, AppColors.darkBlueCard2]
                        : [AppColors.darkBlueCard, AppColors.lightBlueCard],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: Alignment.center,
                child: isSelected
                    ? FittedBox(
                  child: Text(
                    labels[index],
                    style: AppStyles.categoryStyle,
                  ),
                )
                    : icons[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
