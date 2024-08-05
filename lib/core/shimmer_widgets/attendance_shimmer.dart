
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/helper_methods.dart';
import 'my_shimmer.dart';

class AttendanceShimmer extends StatelessWidget {
  const AttendanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ShimmerWidget.rectangular(height: 100.h),
          verticalSpacing(10),
          ShimmerWidget.rectangular(height: 100.h),
          verticalSpacing(10),

          ShimmerWidget.rectangular(height: 100.h),
          verticalSpacing(10),

          ShimmerWidget.rectangular(height: 100.h)
        ]);
  }
}