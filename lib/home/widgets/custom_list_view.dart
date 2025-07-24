import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_bike_shopping_app/core/assets.dart';

import 'custom_card_item.dart';

class CustomListView extends StatelessWidget {
   CustomListView({super.key});
List images = [Assets.bike2,Assets.sefty,Assets.bike3,Assets.bike2,Assets.sefty,Assets.bike3,];
List title = ["Road Bike","Road Helmet","Mountain Bike","Road Bike","Road Helmet","Mountain Bike"];
List subtitle = ["Mountain Bike","SMITH - Trade","PILOT - Chromoly ","Mountain Bike","SMITH - Trade","PILOT - Chromoly "];
List price = ["1,999.99","120","3000","1,999.99","120","3000",];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.h),
      child: SizedBox(
        width: MediaQuery.of(context).size.width-20.w,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding:  EdgeInsets.only(bottom: 40.h,left: 10.w,right: 10.w),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Transform.translate(
              offset: Offset(0, index.isEven ? 50.h : 0),
              child:  CustomCardItem(image: images[index],title: title[index],subtitle: subtitle[index],price: price[index],index: index,),
            );
          },
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 240.h,
          ),
        ),
      ),
    );
  }
}
