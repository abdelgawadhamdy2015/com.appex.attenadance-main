import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/arrow_back_widget.dart';
import 'package:ttech_attendance/core/widgets/app_bar/bottom_app_bar_tablet.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';

import '../../helpers/helper_methods.dart';

class MyAppBarTablet extends StatefulWidget implements PreferredSizeWidget {
  final Function(Locale) changeLanguage;
  final BuildContext context;
  final String tiltle;
  const MyAppBarTablet(
      {super.key,
      required this.changeLanguage,
      required this.context,
      required this.tiltle});

  @override
  State<MyAppBarTablet> createState() => _MyAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * .1);
}

class _MyAppBarState extends State<MyAppBarTablet> {
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
      backgroundColor: Colors.blue,
      iconTheme: const IconThemeData(color: Colors.white),
      bottom: widget.tiltle.isNotEmpty
          ? AppBar(
              backgroundColor: ColorManger.morelightGray,
              title: MyBottomAppBarTablet(
                title: widget.tiltle,
              ),
              leading: const ArrowBackWidget(),
            )
          : null,
      title: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * .07,
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: IntrinsicHeight(
            child: Row(
              children: [
                const VerticalDivider(
                  thickness: 1.5,
                  width: 1,
                  color: Colors.white,
                ),
                horizontalSpacing(MediaQuery.of(context).size.width * .01),
                FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    "images/smaller_apex.png",
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setupDialogState(context, "this notify you", false);
                    context.pushNamed(Routes.departuresScreen);
                  },
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    size: MediaQuery.of(context).size.width * .07,
                  ),
                ),
                horizontalSpacing(MediaQuery.of(context).size.width * .1),
                DropdownButton(
                    dropdownColor: Colors.blueAccent,
                    alignment: AlignmentDirectional.center,
                    style: TextStyles.font25WhiteBold,
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
                horizontalSpacing(MediaQuery.of(context).size.width * .03),
                const VerticalDivider(
                  thickness: 1.5,
                  width: 1,
                  color: Colors.white,
                ),
                horizontalSpacing(MediaQuery.of(context).size.width * .1),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Image.asset(
                    "assets/man.png",
                    //width: MediaQuery.of(context).size.width * .1,
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
