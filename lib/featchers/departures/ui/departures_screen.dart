import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';
import 'package:ttech_attendance/featchers/departures/ui/widget/departures_list_item.dart';

class DeparturesScreen extends StatelessWidget {
  final Function(Locale) changeLanguage;

  const DeparturesScreen({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        changeLanguage: changeLanguage,
        context: context,
        title: MyConstants.mydepatures,
      ),
      drawer: const MyDrawer(),
      body: Container(
        padding: SizeConfig().getScreenPadding(),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const DeparturesListItem(),
                        actions: [
                          Row(
                            mainAxisAlignment:
                                Intl.defaultLocale == MyConstants.arabic
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
                        "request number : 22288272",
                        textAlign: TextAlign.center,
                        style:
                            TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                      ),
                      const Spacer(),
                      Text(
                        "Status",
                        style:
                            TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
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
                        style:
                            TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                      ),
                      Text(
                        " duration : one day",
                        style:
                            TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                      ),
                      Row(
                        children: [
                          Text(
                            "Request Date:14-10-2023",
                            style: TextStyles.blackRegulerStyle(
                                SizeConfig.fontSize3!),
                          ),
                          const Spacer(),
                          Text(
                            maxLines: 2,
                            "annual leave",
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
        ),
      ),
    );
  }
}