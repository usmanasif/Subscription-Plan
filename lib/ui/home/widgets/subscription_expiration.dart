import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/app_text.dart';
import '../../../utils/ui_helpers.dart';

class SubscriptionDetails extends StatelessWidget {
  const SubscriptionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30.r),
            decoration: BoxDecoration(
                color: const Color(0xFF00B4AF),
                borderRadius: BorderRadius.circular(100.r)),
            child: Icon(
              FontAwesomeIcons.medal,
              size: 50.sp,
              color: Colors.white,
            ),
          ),
          verticalSpaceRegular,
          Text(
            "PREMIUM PLAN",
            style: kRubikText.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 22.sp),
          ),
          verticalSpaceSmall,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: const Color(0xFF00B4AF).withOpacity(0.1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Color(0xFFEDA53D),
                ),
                horizontalSpaceSmall,
                Text(
                  "54 Days Left",
                  style: kRubikText.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: const Color(0xFFEDA53D)),
                ),
              ],
            ),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: 250,
            child: Text(
              "Your premium plan will expire on May 22, 2022",
              textAlign: TextAlign.center,
              style: kRubikText.copyWith(
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFFEBEBF0),
                  fontSize: 14.sp),
            ),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}
