import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_bike_shopping_app/core/app_styles.dart';
import 'package:online_bike_shopping_app/core/assets.dart';

import '../../core/app_colors.dart';

class CustomCardItem extends StatefulWidget {
   const CustomCardItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    this.index = 0,
  });
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final int index;

  @override
  State<CustomCardItem> createState() => _CustomCardItemState();
}

class _CustomCardItemState extends State<CustomCardItem> {
 bool isFavorite=false;
 bool isSmallIndex() {
   final mod = widget.index % 4;
   return mod == 1 || mod == 2;
 }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -2.h,
          left: -2.w,
          child: ClipPath(
            clipper: CustomClipperItem(),
            child: Container(
              height:isSmallIndex()?225.h: 245.h,
              width: 169.w,
              decoration: BoxDecoration(color: AppColors.border),
            ),
          ),
        ),
        ClipPath(
          clipper: CustomClipperItem(),
          child: Container(
            height:isSmallIndex()?221.h: 241.h,
            width: 165.w,
            decoration: BoxDecoration(
              color: AppColors.border,
              boxShadow: [],

              gradient: LinearGradient(
                colors: [ AppColors.darkBlueCard,AppColors.lightBlueCard,],
                begin: Alignment.topRight,
                transform: GradientRotation(-0.9),
                end: Alignment.bottomRight,
                stops: [0.3-widget.index, 1.0],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 30.h,
                left: 20.w,
                right: 20.w,
                bottom: 18.h,
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 121.w,
                          height: 89.h,
                          child: Image.asset(widget.image, fit: BoxFit.fill),
                        ),
                      ),
                      15.verticalSpace,
                      FittedBox(child: Text(widget.title, style: AppStyles.priceStyle)),
                      2.verticalSpace,
                      FittedBox(child: Text(widget.subtitle, style: AppStyles.descriptionStyle)),
                      2.verticalSpace,
                      FittedBox(child: Text("\$${widget.price}", style: AppStyles.priceStyle)),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        isFavorite = !isFavorite;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color:isFavorite?AppColors.lightBlue: AppColors.white,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomClipperItem extends CustomClipper<Path> {
  final double slant;
  final double radius;

  CustomClipperItem({this.slant = 40, this.radius = 20});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double w = size.width;
    final double h = size.height;

    path.moveTo(0, h - radius);
    path.quadraticBezierTo(0, h, radius, h);

    path.lineTo(w - radius, h - slant);
    path.quadraticBezierTo(w, h - slant, w, h - slant - radius * 2);

    path.lineTo(w, radius);
    path.quadraticBezierTo(w, 0, w - radius, 0);

    path.lineTo(radius, slant);
    path.quadraticBezierTo(0, slant, 0, slant + radius * 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
