import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../helpers/helper_methods.dart';
import '../helpers/size_config.dart';
import '../theming/text_styles.dart';
import 'my_shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double shimmerIconHeight = SizeConfig.screenHeight! * .01;
    return SafeArea(
        child: SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          verticalSpacing(SizeConfig.screenHeight! * .03),
          Text(
            S.of(context).attendanceMovementsToday,
            style: TextStyles.font15BlueBold,
          ),
          ShimmerWidget.rectangular(height: SizeConfig.screenWidth! * .1),
          verticalSpacing(SizeConfig.screenHeight! * .01),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * .016,
                  vertical: SizeConfig.screenHeight! * .016),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).quickAccessList,
                    style: TextStyles.font15BlueBold,
                  ),
                  verticalSpacing(16),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Card(
                          child: FittedBox(
                              child: ShimmerWidget.circular(
                                  width: shimmerIconHeight,
                                  height: shimmerIconHeight))),
                      Card(
                          child: FittedBox(
                              child: ShimmerWidget.circular(
                                  width: shimmerIconHeight,
                                  height: shimmerIconHeight))),
                      Card(
                          child: FittedBox(
                              child: ShimmerWidget.circular(
                                  width: shimmerIconHeight,
                                  height: shimmerIconHeight))),
                      Card(
                          child: FittedBox(
                              child: ShimmerWidget.circular(
                                  width: shimmerIconHeight,
                                  height: shimmerIconHeight))),
                      Card(
                          child: FittedBox(
                              child: ShimmerWidget.circular(
                                  width: shimmerIconHeight,
                                  height: shimmerIconHeight))),
                      Card(
                          child: FittedBox(
                              child: ShimmerWidget.circular(
                                  width: shimmerIconHeight,
                                  height: shimmerIconHeight))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * .016,
                  vertical: SizeConfig.screenHeight! * .016),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).eventsApprovals,
                    style: TextStyles.font15BlueBold,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * .05),
                  Card(
                    color: Colors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ShimmerWidget.rectangular(
                            height: SizeConfig.screenHeight! * .05);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}
