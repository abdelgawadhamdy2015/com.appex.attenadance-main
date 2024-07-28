import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class EventsApprovalsTablet extends StatelessWidget {
  const EventsApprovalsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).eventsApprovals,
              style: TextStyles.font30BlackBold,
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
                  return ListTile(
                    leading: const Icon(Icons.notification_important),
                    title: Text('تنبيه ${index + 1}',
                        style: TextStyles.font16BlackBold),
                    subtitle: Text(
                      'تفاصيل التنبيه',
                      style: TextStyles.font15Black54reguler,
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
