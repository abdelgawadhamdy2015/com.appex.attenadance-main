import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_model.dart';
import 'package:ttech_attendance/featchers/departures/logic/cubit/departure_cubit.dart';
import 'package:ttech_attendance/featchers/departures/logic/cubit/departure_state.dart';
import 'package:ttech_attendance/featchers/departures/ui/widget/departure_bloc_listener.dart';
import 'package:ttech_attendance/featchers/departures/ui/widget/departures_list_item.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class DeparturesScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const DeparturesScreen({super.key, required this.changeLanguage});

  @override
  State<DeparturesScreen> createState() => _DeparturesScreenState();
}

class _DeparturesScreenState extends State<DeparturesScreen> {
  String departureType = MyConstants.permission;
  List<DepartureModel> departures = [];
  //List<DepartureModel> departuresByType = <DepartureModel>[];
  @override
  void initState() {
    super.initState();

    departures = context.read<DepartureCubit>().departures;
    getDeparture(1, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        changeLanguage: widget.changeLanguage,
        context: context,
        title: MyConstants.mydepatures,
      ),
      drawer: const MyDrawer(),
      body: Container(
        padding: SizeConfig().getScreenPadding(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Transform.scale(
                    scale: SizeConfig.screenWidth! * .003,
                    child: Radio<String>(
                      activeColor: ColorManger.mainBlue,
                      value: MyConstants.permission,
                      groupValue: departureType,
                      onChanged: (String? value) {
                        setState(() {
                          departureType = value!;
                          getDeparture(1, context);
                        });
                      },
                    ),
                  ),
                  horizontalSpacing(SizeConfig.screenWidth! * .02),
                  Text(
                    S.of(context).permission,
                    style: TextStyles.blackBoldStyle(SizeConfig.fontSize4!),
                  ),
                  horizontalSpacing(SizeConfig.screenWidth! * .15),
                  Transform.scale(
                    scale: SizeConfig.screenWidth! * .003,
                    child: Radio<String>(
                      activeColor: ColorManger.mainBlue,
                      value: MyConstants.request,
                      groupValue: departureType,
                      onChanged: (String? value) {
                        setState(() {
                          departureType = value!;
                          getDeparture(2, context);
                        });
                      },
                    ),
                  ),
                  horizontalSpacing(SizeConfig.screenWidth! * .02),
                  Text(S.of(context).annual,
                      style: TextStyles.blackBoldStyle(SizeConfig.fontSize4!)),
                ]),
              ],
            ),
            const DepartureBlocListener(),
            Expanded(
              child: BlocBuilder<DepartureCubit, DepartureState>(
                builder: (context, state) {
                  departures = context.read<DepartureCubit>().departures;

                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: departures.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: DeparturesListItem(
                                    departureModel: departures[index],
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: Intl.defaultLocale ==
                                              MyConstants.arabic
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () async {
                                            context.pop();
                                          },
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Accept",
                                            style: TextStyles.blackBoldStyle(
                                                SizeConfig.fontSize3!),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            context.pop();
                                          },
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Refuse",
                                            style: TextStyles.blackBoldStyle(
                                                SizeConfig.fontSize3!),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            context.pop();
                                          },
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "cancel",
                                            style: TextStyles.blackBoldStyle(
                                                SizeConfig.fontSize3!),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Card(
                          color: ColorManger.lightGray,
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "request number : ${departures[index].id}",
                                  textAlign: TextAlign.center,
                                  style: TextStyles.blackRegulerStyle(
                                      SizeConfig.fontSize3!),
                                ),
                                const Spacer(),
                                Text(
                                  "Status : ${departures[index].statusArabic} ",
                                  style: TextStyles.blackRegulerStyle(
                                      SizeConfig.fontSize3!),
                                  textScaler: MediaQuery.textScalerOf(context),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "date : from ${departures[index].shiftDetails!.shift1Start!} to ${departures[index].shiftDetails!.shift1End!} ",
                                  style: TextStyles.blackRegulerStyle(
                                      SizeConfig.fontSize3!),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Branch : ${departures[index].branch!.arabicName!}",
                                      style: TextStyles.blackRegulerStyle(
                                          SizeConfig.fontSize3!),
                                    ),
                                    const Spacer(),
                                    Text(
                                      maxLines: 2,
                                      departures[index].vacation == null
                                          ? departures[index].shift!.arabicName!
                                          : departures[index]
                                              .vacation!
                                              .arabicName!,
                                      style: TextStyles.blackRegulerStyle(
                                          SizeConfig.fontSize3!),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getDeparture(int type, BuildContext context) {
    departureType == MyConstants.permission
        ? context.read<DepartureCubit>().emitPermissionState(1)
        : context.read<DepartureCubit>().emitDepartureState(1);
  }
}
