import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../helpers/methods.dart';
import '../theming/text_styles.dart';
import 'my_shimmer.dart';

class HomeShimmer extends StatelessWidget{
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {

   return SafeArea(child: SingleChildScrollView(
     child: Center(
         child:Column(
           children: [
             verticalSpacing(30.h),
             Text(
               S.of(context).attendanceMovementsToday,
               style: TextStyles.font12blackBold,
             ),
             ShimmerWidget.rectangular(height: 100.h),
             verticalSpacing(10),


             Card(
               child: Container(
                 padding: const EdgeInsets.all(16.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       S.of(context).quickAccessList,
                       style: TextStyles.font12blackBold,
                     ),
                     verticalSpacing(16),
                     GridView.count(
                       crossAxisCount: 3,
                       shrinkWrap: true,
                       mainAxisSpacing: 10,
                       physics: const NeverScrollableScrollPhysics(),
                       children: [
                         Card(child: FittedBox(child: ShimmerWidget.circular(width: 10.w, height: 10.h))),
                         Card(child: FittedBox(child: ShimmerWidget.circular(width: 10.w, height: 10.h))),
                         Card(child: FittedBox(child: ShimmerWidget.circular(width: 10.w, height: 10.h))),
                         Card(child: FittedBox(child: ShimmerWidget.circular(width: 10.w, height: 10.h))),
                         Card(child: FittedBox(child: ShimmerWidget.circular(width: 10.w, height: 10.h))),
                         Card(child: FittedBox(child: ShimmerWidget.circular(width: 10.w, height: 10.h))),
                       ],
                     ),
                   ],
                 ),
               ),
             )


             ,
             Card(
               child: Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       S.of(context).eventsApprovals,
                       style: TextStyles.font12blackBold,
                     ),
                     const SizedBox(height: 16),
                     // هنا يمكنك إضافة منطق عرض التنبيهات الحية من الباك اند
                     Card(
                       color: Colors.white,
                       child: ListView.builder(
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: 2, // هنا يمكنك وضع عدد التنبيهات الفعلية
                         itemBuilder: (context, index) {
                           return ShimmerWidget.rectangular(height: 50.h);
                         },
                       ),
                     ),
                   ],
                 ),
               ),
             )
           ],
         )
     ),
   ));
  }

}