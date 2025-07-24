import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_colors.dart';

class BackgroundShape extends StatelessWidget {
  const BackgroundShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ParallelogramClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 400.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(3.14),
            colors: [AppColors.lightBlue2, AppColors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}

class ParallelogramClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double slant = 300.w;

    Path path = Path();
    path.moveTo(slant, 0);
    path.lineTo(size.width, 50.w);
    path.lineTo(size.width, size.height);
    path.lineTo(-20.h, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
