import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/bottom_app_bar.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(Locale) changeLanguage;
  final BuildContext context;
  final String title;
  const MyAppBar(
      {super.key,
      required this.changeLanguage,
      required this.context,
      required this.title});

  @override
  Size get preferredSize => title.isEmpty
      ? Size.fromHeight(SizeConfig.screenHeight! * .07)
      : Size.fromHeight(SizeConfig.screenHeight! * .12);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
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
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(right: SizeConfig.screenWidth! * .01),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size:
                    SizeConfig.screenWidth! * .035, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          );
        },
      ),
      backgroundColor: ColorManger.darkBlue,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarHeight: widget.title.isNotEmpty
          ? SizeConfig.screenHeight! * .09
          : SizeConfig.screenHeight! * .07,
      bottom: widget.title.isNotEmpty
          ? MyBottomAppBar(title: widget.title, context: context)
          : null,
      title: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalDivider(
              thickness: SizeConfig.screenWidth! * .005,
              width: SizeConfig.screenWidth! * .001,
              color: Colors.white,
            ),
            Image.asset(
              "images/small_apex.png",
              width: SizeConfig.screenWidth! * .15,
            ),
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.departuresScreen);
              },
              icon: Icon(
                Icons.notifications_none_outlined,
                size: SizeConfig.iconSize5,
              ),
            ),
            Transform.scale(
              scale: 1.4,
              alignment: Alignment.center,
              child: DropdownButton(
                  iconSize: SizeConfig.iconSize5!,
                  dropdownColor: Colors.blueAccent,
                  alignment: AlignmentDirectional.center,
                  style: TextStyles.whiteRegulerStyle(SizeConfig.fontSize3!),
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
            ),
            VerticalDivider(
              thickness: SizeConfig.screenWidth! * .005,
              width: SizeConfig.screenWidth! * .005,
              color: Colors.white,
            ),
            ClipOval(
              child: Image.asset(
                "assets/man.png",
                width: SizeConfig.screenWidth! * .1,
                height: SizeConfig.screenHeight! * .1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
