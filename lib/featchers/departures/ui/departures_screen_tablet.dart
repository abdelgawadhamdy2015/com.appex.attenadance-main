import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar_tablet.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';

class DeparturesScreenTablet extends StatelessWidget {
  final Function(Locale) changeLanguage;
  const DeparturesScreenTablet({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarTablet(
        tiltle: MyConstants.mydepatures,
        context: context,
        changeLanguage: changeLanguage,
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: Container(
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
                        style: TextStyles.font20Black54reguler,
                        textScaler: MediaQuery.textScalerOf(context),
                      ),
                      const Spacer(),
                      Text(
                        "Status",
                        style: TextStyles.font20BlackBold,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "date : from date to date ",
                        style: TextStyles.font20Black54reguler,
                      ),
                      Text(
                        " duration : one day",
                        style: TextStyles.font20Black54reguler,
                      ),
                      Row(
                        children: [
                          Text(
                            "Request Date : 14-10-2023",
                            style: TextStyles.font20Black54reguler,
                          ),
                          const Spacer(),
                          Text(
                            "sdssdsdsd",
                            style: TextStyles.font20BlackBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
