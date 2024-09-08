import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';

class DeparturesListItem extends StatelessWidget {
  const DeparturesListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            child: Card(
      color: ColorManger.lightGray,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "request number : 22288272",
              textAlign: TextAlign.center,
              style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
            ),
            const Spacer(),
            Text(
              "Status",
              style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
              textScaler: MediaQuery.textScalerOf(context),
            ),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "date : from date to date ",
              style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
            ),
            Text(
              " duration : one day",
              style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
            ),
            Row(
              children: [
                Text(
                  "Request Date:14-10-2023",
                  style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                ),
                const Spacer(),
                Text(
                  maxLines: 2,
                  "annual leave",
                  style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
