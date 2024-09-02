import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/bottom_app_bar_tablet.dart';

import '../../helpers/helper_methods.dart';

class MyAppBarTablet extends StatefulWidget implements PreferredSizeWidget {
  final Function(Locale) changeLanguage;
  final BuildContext context;
  final String title;
  const MyAppBarTablet(
      {super.key,
      required this.changeLanguage,
      required this.context,
      required this.title});

  @override
  Size get preferredSize => title.isEmpty
      ? Size.fromHeight(SizeConfig.screenHeight! * .07)
      : Size.fromHeight(SizeConfig.screenHeight! * .12);

  @override
  State<MyAppBarTablet> createState() => _MyAppBarTabletState();
}

class _MyAppBarTabletState extends State<MyAppBarTablet> {
  List<DropdownMenuItem> items = {'English', 'العربية'}.map((String choice) {
    return DropdownMenuItem<String>(
      value: choice,
      child: Text(choice),
    );
  }).toList();
  String language = "";
  @override
  void initState() {
    super.initState();
    if (Intl.defaultLocale == MyConstants.english) {
      language = "English";
    } else {
      language = "العربية";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManger.darkBlue,
      iconTheme: const IconThemeData(color: Colors.white),
      bottom: widget.title.isNotEmpty
          ? MyBottomAppBarTablet(title: widget.title, context: context)
          : null,
      title: IntrinsicHeight(
        child: Row(
          children: [
            const VerticalDivider(
              thickness: 3,
              width: 3,
              color: Colors.white,
            ),
            Image.asset(
              "images/small_apex.png",
              width: SizeConfig.screenWidth! * .15,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.departuresScreen);
              },
              icon: Icon(
                Icons.notifications_none_outlined,
                size: MediaQuery.of(context).size.width * .07,
              ),
            ),
            horizontalSpacing(SizeConfig.screenWidth! * .05),
            DropdownButton(
                dropdownColor: Colors.blueAccent,
                alignment: AlignmentDirectional.center,
                style: TextStyles.font28whiteReguler,
                items: items,
                value: language,
                onChanged: (value) {
                  if (value == 'English') {
                    widget.changeLanguage(const Locale('en'));
                    setState(() {
                      language = "English";
                    });
                  } else if (value == 'العربية') {
                    widget.changeLanguage(const Locale('ar'));

                    setState(() {
                      language = "العربية";
                    });
                  }
                }),
            horizontalSpacing(SizeConfig.screenWidth! * .05),
            const VerticalDivider(
              thickness: 3,
              width: 3,
              color: Colors.white,
            ),
            const Spacer(),
            Expanded(
              child: Container(
                width: SizeConfig.screenWidth! * .1,
                height: SizeConfig.screenHeight! * .2,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "assets/man.png",
                  scale: .5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
