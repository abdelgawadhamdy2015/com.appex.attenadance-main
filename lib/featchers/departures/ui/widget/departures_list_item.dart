import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_model.dart';

class DeparturesListItem extends StatelessWidget {
  const DeparturesListItem({super.key, required this.departureModel});
  final DepartureModel departureModel;

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
                departureModel.requestNumber!,
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
                departureModel.from!,
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
                departureModel.to!,
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
                departureModel.requestgDate!,
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
                departureModel.status!,
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
