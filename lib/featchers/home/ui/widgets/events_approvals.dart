// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_model.dart';
import 'package:ttech_attendance/featchers/departures/logic/cubit/departure_cubit.dart';
import 'package:ttech_attendance/featchers/departures/logic/cubit/departure_state.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/helpers/size_config.dart';

class EventsApprovals extends StatelessWidget {
  EventsApprovals({super.key});
  List<DepartureModel> departure = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<DepartureCubit, DepartureState>(
        builder: (context, state) {
          departure = context.read<DepartureCubit>().departures;
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth! * .016,
                vertical: SizeConfig.screenHeight! * .016),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).eventsApprovals,
                  style: TextStyles.darkBlueBoldStyle(SizeConfig.fontSize4!),
                ),
                verticalSpacing(SizeConfig.screenWidth! * .016),
                Card(
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5, // هنا  عدد التنبيهات الفعلية
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.notification_important),
                        title: Text(
                            ' ${getRequestType(departure[index].type, context)}',
                            style: TextStyles.blackBoldStyle(
                                SizeConfig.fontSize3!)),
                        subtitle: Text(
                          '${departure[index].requestNumber} is ${departure[index].status} ',
                          style: TextStyles.blackRegulerStyle(
                              SizeConfig.fontSize3!),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
