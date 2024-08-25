import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/helpers/size_config.dart';

class EventsApprovals extends StatelessWidget {
  const EventsApprovals({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            verticalSpacing(SizeConfig.screenWidth! * .016),
            Card(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2, // هنا يمكنك وضع عدد التنبيهات الفعلية
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.notification_important),
                    title: Text('تنبيه ${index + 1}',
                        style: TextStyles.font12blackBold),
                    subtitle: Text(
                      'تفاصيل التنبيه',
                      style: TextStyles.font12black54Reguler,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
