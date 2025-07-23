import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_colors.dart';
import '../widgets/back_ground_shape_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Stack(children: [
        Positioned(
            top: 200.h,
            child: BackgroundShape())
      ],),
    );
  }
}

