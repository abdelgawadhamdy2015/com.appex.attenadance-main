import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_model.dart';
import 'package:ttech_attendance/generated/l10n.dart';

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
                "${S.of(context).requestNumber} : ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                departureModel.id!.toString(),
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
                S.of(context).to,
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                DateFormat("dd/mm/yyyy").format(departureModel.startdate!),
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
                S.of(context).to,
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                DateFormat("dd/mm/yyyy").format(departureModel.enddate!),
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
                "${S.of(context).branch} : ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                departureModel.branch!.arabicName!,
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
                "${S.of(context).status} : ",
                textAlign: TextAlign.center,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
              Text(
                departureModel.statusArabic!,
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
