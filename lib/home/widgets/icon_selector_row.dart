import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_colors.dart';
import '../../core/assets.dart';
import 'custom_card_item.dart';

class IconSelectorRow extends StatefulWidget {
  const IconSelectorRow({super.key});

  @override
  State<IconSelectorRow> createState() => _IconSelectorRowState();
}

class _IconSelectorRowState extends State<IconSelectorRow> {
  int selectedIndex = 0;

  final List<String> icons = [
    Assets.bicycle,
    Assets.map,
    Assets.cart,
    Assets.person,
    Assets.doc,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(icons.length, (index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: isSelected
              ? Transform.rotate(
                  angle: -0.1,
                  child: Transform.translate(
                    offset: const Offset(0, -20),
                    child: ClipPath(
                      clipper: CustomClipperItem(slant: 9, radius: 15.r),
                      child: Container(
                        height: 70.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.lightBlue1, AppColors.lightBlue],

                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Center(
                            child: SvgPicture.asset(
                              icons[index],
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(icons[index]),
                  ),
                ),
        );
      }),
    );
  }
}

class BottomSlantedClipperWithRadiusNB extends CustomClipper<Path> {
  final double slant;
  final double radius;

  BottomSlantedClipperWithRadiusNB({this.slant = 35, this.radius = 20});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double w = size.width;
    final double h = size.height;

    path.moveTo(0, h - radius);
    path.quadraticBezierTo(0, h, radius, h);

    path.lineTo(w, h);
    path.quadraticBezierTo(w, h, w, h);

    path.lineTo(w, radius);
    path.quadraticBezierTo(w, 0, w, 0);

    path.lineTo(radius, slant);
    path.quadraticBezierTo(0, slant, 0, slant);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
