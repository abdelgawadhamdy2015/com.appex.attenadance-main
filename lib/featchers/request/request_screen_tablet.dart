import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar_tablet.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drower_tablet.dart';
import 'package:ttech_attendance/featchers/request/permission/ui/widgets/permission_form_tablet.dart';
import 'package:ttech_attendance/featchers/request/request_form/ui/widget/request_form_tablet.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class RequestScreenTablet extends StatefulWidget {
  const RequestScreenTablet({super.key, required this.changeLanguage});
  final Function(Locale) changeLanguage;

  @override
  State<RequestScreenTablet> createState() => _RequestScreenTabletState();
}

class _RequestScreenTabletState extends State<RequestScreenTablet> {
  String requestType = MyConstants.permission;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarTablet(
          changeLanguage: widget.changeLanguage,
          context: context,
          title: MyConstants.myRequests),
      drawer: const Drawer(child: MyDrowerTablet()),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: SizeConfig().getScreenPadding(),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        S.of(context).permission,
                        style: TextStyles.font30BlackBold,
                      ),
                      leading: Radio<String>(
                        activeColor: ColorManger.mainBlue,
                        value: MyConstants.permission,
                        groupValue: requestType,
                        onChanged: (String? value) {
                          setState(() {
                            requestType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  verticalSpacing(SizeConfig.screenHeight! * .02),
                  Expanded(
                    child: ListTile(
                      title: Text(S.of(context).annual,
                          style: TextStyles.font30BlackBold),
                      leading: Radio<String>(
                        activeColor: ColorManger.mainBlue,
                        value: MyConstants.request,
                        groupValue: requestType,
                        onChanged: (String? value) {
                          setState(() {
                            requestType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              requestType == MyConstants.permission
                  ? const PermissionFormTablet()
                  : const RequestFormScreenTablet()
            ],
          ),
        ),
      )),
    );
  }
}
