import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_bike_shopping_app/core/app_styles.dart';
import 'package:online_bike_shopping_app/core/assets.dart';

import '../../core/app_colors.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      width: 350.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -2.h,
            left: -2.w,
            child: ClipPath(
              clipper: BottomSlantedClipperWithRadius(radius: 19, slant: 60),
              child: Container(
                height: 245.h,
                width: 355.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.border,
                ),
              ),
            ),
          ),
          Positioned(
            top: 1.h,
            left: 1.w,
            child: ClipPath(
              clipper: BottomSlantedClipperWithRadius(radius: 20, slant: 60),
              child: Container(
                height: 240.h,
                width: 350.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.darkBlueCard2,
                      AppColors.darkBlueCard2,
                      AppColors.lightBlueCard,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(Assets.bike),
                      ),
                      Text('30% Off', style: AppStyles.titleStyle),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSlantedClipperWithRadius extends CustomClipper<Path> {
  final double slant;
  final double radius;

  BottomSlantedClipperWithRadius({this.slant = 30, this.radius = 16});

  @override
  Path getClip(Size size) {
    final path = Path();

    final double w = size.width;
    final double h = size.height;

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.lineTo(w - radius, 0);
    path.quadraticBezierTo(w, 0, w, radius);

    path.lineTo(w, h - slant - radius);
    path.quadraticBezierTo(w, h - slant, w - radius, h - slant);

    path.lineTo(radius, h);
    path.quadraticBezierTo(0, h, 0, h - radius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
