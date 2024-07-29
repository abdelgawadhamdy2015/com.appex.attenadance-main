import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/methods.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/mytextfile.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/login/logic/cubit/login_cubit.dart';
import 'package:ttech_attendance/featchers/login/ui/widget/login_bloc_listener.dart';
import 'package:ttech_attendance/featchers/login/ui/widget/login_screen_tablet.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../core/widgets/passwordtext.dart';

class LoginScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const LoginScreen({super.key, required this.changeLanguage});

  @override
  LoginScreenState createState() =>
      // ignore: no_logic_in_create_state
      LoginScreenState(changeLanguage: changeLanguage);
}

class LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  String selectedLanguage = 'English';
  bool circaleLoadFlag = false;
  bool lang = true;
  bool languageButtonPressed = false;
  final Function(Locale) changeLanguage;
  LoginScreenState({required this.changeLanguage});
@override
  void initState()  {
    super.initState();
    // final authProvider = Provider.of<AuthProvider>(context);
    // authProvider.clearToken();
    clearToken();

}

clearToken() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();

}
  @override
  Widget build(BuildContext context) {


    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            backgroundColor: const Color(0xffffffff),
            body: OfflineBuilderWidget(
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03,
                      vertical: MediaQuery.of(context).size.height * .03),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .07,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "images/small_apex.png",
                                fit: BoxFit.fill,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (selectedLanguage == "English") {
                                    setState(() {
                                      selectedLanguage = "Arabic";
                                      changeLanguage(const Locale("ar"));
                                    });
                                  } else {
                                    setState(() {
                                      selectedLanguage = "English";
                                      changeLanguage(const Locale("en"));
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  //Size.fromWidth(110.w),

                                  backgroundColor: Colors.white,
                                ),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    selectedLanguage,
                                    style: TextStyles.font16BlueBold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text(S.of(context).login,
                                style: TextStyles.font18BlackBold),
                          ),
                        ),
                        Form(
                          key: context.read<LoginCubit>().formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 15),
                                child: Text(
                                  S.of(context).dbName,
                                  style: TextStyles.font12blackBold,
                                ),
                              ),
                              MyTextForm(
                                  hint: S.of(context).dbName,
                                  excep: S.of(context).dbName,
                                  control:
                                      context.read<LoginCubit>().dbController),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 15),
                                child: Text(
                                  S.of(context).email,
                                  style: TextStyles.font12blackBold,
                                ),
                              ),
                              MyTextForm(
                                hint: S.of(context).email,
                                excep: S.of(context).email,
                                control:
                                    context.read<LoginCubit>().emailController,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 15),
                                child: Text(
                                  S.of(context).password,
                                  style: TextStyles.font12blackBold,
                                ),
                              ),
                              PasswordText(
                                  hint: S.of(context).password,
                                  obsecur: true,
                                  control: context
                                      .read<LoginCubit>()
                                      .passwordController),
                              verticalSpacing(
                                  MediaQuery.of(context).size.height * .05),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(S.of(context).rememberMe),
                                      Checkbox(
                                          value: rememberMe,
                                          onChanged: (val) {
                                            setState(() {
                                              rememberMe = val!;
                                            });
                                          }),
                                    ],
                                  ),
                                  InkWell(
                                    child: Text(
                                      S.of(context).forgetPassword,
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      context
                                          .read<LoginCubit>()
                                          .formKey
                                          .currentState!
                                          .reset();
                                      context.pushNamed(
                                          Routes.forgetPasswordSccreen);
                                    },
                                  ),
                                ],
                              ),
                              verticalSpacing(
                                  MediaQuery.of(context).size.height * .03),
                              Container(
                                padding: EdgeInsets.only(top: 10.h),
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * .08,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    validateThenDoLogin(context);
                                  },
                                  style: ElevatedButton.styleFrom(),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: context
                                            .read<LoginCubit>()
                                            .circaleLoadFlag
                                        ? const CircularProgressIndicator(
                                            color: Colors.purpleAccent,
                                          )
                                        : Text(
                                            S.of(context).login,
                                            style: TextStyles.font16BlueBold,
                                          ),
                                  ),
                                ),
                              ),
                              LoginBlocListener(
                                rememberMe: rememberMe,
                                changeLanguage: widget.changeLanguage,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ))
        : LoginScreenTablet(changeLanguage: changeLanguage);
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
