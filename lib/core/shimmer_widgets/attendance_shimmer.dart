
import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import '../helpers/helper_methods.dart';
import 'my_shimmer.dart';

class AttendanceShimmer extends StatelessWidget {
  const AttendanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double height=SizeConfig.screenHeight!*.1;
    double space=SizeConfig.screenHeight!*.01;
    return Column(
        children: [
          ShimmerWidget.rectangular(height: height),
          verticalSpacing(space),
          ShimmerWidget.rectangular(height: height),
          verticalSpacing(space),
          ShimmerWidget.rectangular(height: height),
          verticalSpacing(space),
          ShimmerWidget.rectangular(height: height)
        ]);
  }
}