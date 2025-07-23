import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_bike_shopping_app/core/app_styles.dart';

import '../../core/app_colors.dart';
import '../../core/assets.dart';
import '../widgets/back_ground_shape_widget.dart';
import '../widgets/custom_card_item.dart';
import '../widgets/custom_category_widget.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/custom_slider_widget.dart';

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
            top: 150.h,
            left: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 30.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 180.h,
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
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 0.w,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 105.h,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: BottomSlantedClipperWithRadius(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 105.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          transform: GradientRotation(3.14),
                          colors: [
                            AppColors.darkBlueCard2,
                            AppColors.lightBlueCard,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  IconSelectorRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
              ? Transform.translate(
                  offset: const Offset(0, -20),
                  child: ClipPath(
                    clipper: CustomClipperItem(slant: 9, radius: 20.r),
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.lightBlue,
                            AppColors.lightBlue2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child:          SizedBox(
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

class BottomSlantedClipperWithRadius extends CustomClipper<Path> {
  final double slant;
  final double radius;

  BottomSlantedClipperWithRadius({this.slant = 35, this.radius = 20});

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
