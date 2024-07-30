import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/shimmer_widgets/my_shimmer.dart';

import '../theming/colors.dart';

class DeparturesShimmer extends StatelessWidget {
  const DeparturesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManger.morelightGray,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ShimmerWidget.rectangular(height: 150.h,

            );
          }),
    );
  }
}
