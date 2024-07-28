import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/my_drawer.dart';
import 'package:ttech_attendance/featchers/departures/ui/departures_screen_tablet.dart';

class DeparturesScreen extends StatelessWidget {
  final Function(Locale) changeLanguage;
  const DeparturesScreen({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            backgroundColor: ColorManger.morelightGray,
            appBar: MyAppBar(
              changeLanguage: changeLanguage,
              context: context,
              title: mydepatures,
            ),
            drawer: const Drawer(
              child: MyDrawer(),
            ),
            body: Container(
                color: ColorManger.morelightGray,
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.w),
                child: Card(
                  color: ColorManger.morelightGray,
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "request number : 22288272",
                                  textAlign: TextAlign.center,
                                  style: TextStyles.font12black54Reguler,
                                  //stextScaler: MediaQuery.textScalerOf(context),
                                ),
                                const Spacer(),
                                Text(
                                  "Status",
                                  style: TextStyles.font12black54Reguler,
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
                                  style: TextStyles.font12black54Reguler,
                                ),
                                Text(
                                  " duration : one day",
                                  style: TextStyles.font12black54Reguler,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Request Date:14-10-2023",
                                      style: TextStyles.font12black54Reguler,
                                    ),
                                    const Spacer(),
                                    Text(
                                      maxLines: 2,
                                      "sdssdsdsd",
                                      style: TextStyles.font12black54Reguler,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )),
          )
        : DeparturesScreenTablet(changeLanguage: changeLanguage);
  }
}
