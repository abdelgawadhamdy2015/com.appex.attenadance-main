import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';

class DeparturesListItem extends StatelessWidget {
  const DeparturesListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "request number : ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                "0000000",
                style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                textScaler: MediaQuery.textScalerOf(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "from: ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                "12/5/2024",
                style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                textScaler: MediaQuery.textScalerOf(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "to: ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                "14/5/2024",
                style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                textScaler: MediaQuery.textScalerOf(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "duration : ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                "3 days",
                style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                textScaler: MediaQuery.textScalerOf(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "request date : ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                "11/4/2024",
                style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                textScaler: MediaQuery.textScalerOf(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "status : ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                "11/4/2024",
                style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                textScaler: MediaQuery.textScalerOf(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
