import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';
import 'package:ttech_attendance/featchers/request/permission/ui/widgets/permission_form.dart';
import 'package:ttech_attendance/featchers/request/request_form/ui/widget/request_form.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key, required this.changeLanguage});
  final Function(Locale) changeLanguage;

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  String requestType = MyConstants.permission;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          changeLanguage: widget.changeLanguage,
          context: context,
          title: MyConstants.myRequests),
      drawer: const Drawer(child: MyDrawer()),
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
                        style: TextStyles.font18BlackBold,
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
                          style: TextStyles.font18BlackBold),
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
                  ? const PermissionForm()
                  : const RequestFormScreen()
            ],
          ),
        ),
      )),
    );
  }
}
