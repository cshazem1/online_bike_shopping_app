import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle descriptionStyle = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle appBarStyle = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle titleStyle = GoogleFonts.poppins(
    color: AppColors.white.withValues(alpha: (0.6 * 255)),
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle categoryStyle = GoogleFonts.poppins(
    color: AppColors.white.withValues(alpha: (0.6 * 255)),
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle priceStyle = GoogleFonts.poppins(
    color: AppColors.white.withValues(alpha: (0.6 * 255)),
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
}
