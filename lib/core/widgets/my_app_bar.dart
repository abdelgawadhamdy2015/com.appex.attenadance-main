import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/bottom_app_bar.dart';

import '../helpers/methods.dart';

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
      ? Size.fromHeight(MediaQuery.of(context).size.height * .05)
      : Size.fromHeight(MediaQuery.of(context).size.height * .12);

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
    if (Intl.defaultLocale == english) {
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
      bottom: widget.title.isNotEmpty
          ? MyBottomAppBar(title: widget.title, context: context)
          : null,
      title: IntrinsicHeight(
        child: Row(
          children: [
            const VerticalDivider(
              thickness: 1.5,
              width: 1,
              color: Colors.white,
            ),
            // horozintalSpacing(MediaQuery.of(context).size.width * .05),
            Image.asset(
              "images/smaller_apex.png",
              width: MediaQuery.of(context).size.width * .15,
            ),
            const Spacer(),
            const Icon(Icons.notifications_none_outlined),
            horizontalSpacing(MediaQuery.of(context).size.width * .05),
            DropdownButton(
                dropdownColor: Colors.blueAccent,
                alignment: AlignmentDirectional.center,
                style: TextStyles.font12WhiteBold,
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
            horizontalSpacing(MediaQuery.of(context).size.width * .05),
            const VerticalDivider(
              thickness: 1.5,
              width: 1,
              color: Colors.white,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: Image.asset(
                "assets/man.png",
                height: MediaQuery.of(context).size.height * .05,
              ),
            )
          ],
        ),
      ),
    );
  }
}
