import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_text_button.dart';
import 'package:ttech_attendance/core/widgets/indicator/my_progress_indicator.dart';
import 'package:ttech_attendance/core/widgets/mytextfile.dart';
import 'package:ttech_attendance/core/widgets/passwordtext.dart';
import 'package:ttech_attendance/featchers/login/logic/cubit/login_cubit.dart';
import 'package:ttech_attendance/featchers/login/logic/cubit/login_state.dart';
import 'package:ttech_attendance/featchers/login/ui/widget/login_bloc_listener.dart';
import 'package:ttech_attendance/generated/l10n.dart';
import '../../../core/helpers/helper_methods.dart';

class LoginScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const LoginScreen({super.key, required this.changeLanguage});

  @override
  LoginScreenState createState() => // ignore: no_logic_in_create_state
      LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  String selectedLanguage = 'Arabic';

  LoginScreenState();

  @override
  void initState() {
    super.initState();
    // delete token from shared preference
    clearToken();
  }

  clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Container(
          padding: SizeConfig().getScreenPadding(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * .07,
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
                              widget.changeLanguage(const Locale("ar"));
                            });
                          } else {
                            setState(() {
                              selectedLanguage = "English";
                              widget.changeLanguage(const Locale("en"));
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          //Size.fromWidth(110.w),

                          backgroundColor: Colors.white,
                        ),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            selectedLanguage,
                            style: TextStyles.font15BlueBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: SizeConfig.screenHeight! * .01),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * .016,
                            vertical: SizeConfig.screenHeight! * .016),
                        child: Text(
                          S.of(context).dbName,
                          style: TextStyles.font12blackBold,
                        ),
                      ),
                      MyTextForm(
                          fillColor: ColorManger.lightGray,
                          hint: S.of(context).dbName,
                          excep: S.of(context).dbName,
                          controller: context.read<LoginCubit>().dbController),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * .016,
                            vertical: SizeConfig.screenHeight! * .016),
                        child: Text(
                          S.of(context).email,
                          style: TextStyles.font12blackBold,
                        ),
                      ),
                      MyTextForm(
                        fillColor: ColorManger.lightGray,
                        hint: S.of(context).email,
                        excep: S.of(context).email,
                        controller: context.read<LoginCubit>().emailController,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * .016,
                            vertical: SizeConfig.screenHeight! * .016),
                        child: Text(
                          S.of(context).password,
                          style: TextStyles.font12blackBold,
                        ),
                      ),
                      PasswordText(
                          fillColor: ColorManger.lightGray,
                          hint: S.of(context).password,
                          obsecur: true,
                          control:
                              context.read<LoginCubit>().passwordController),
                      verticalSpacing(SizeConfig.screenHeight! * .05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(S.of(context).rememberMe),
                              Checkbox(
                                  activeColor: ColorManger.radioButtonBlue,
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
                                  color: ColorManger.forgetPassswordTextColor,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              context
                                  .read<LoginCubit>()
                                  .formKey
                                  .currentState!
                                  .reset();
                              context.pushNamed(Routes.forgetPasswordSccreen);
                            },
                          ),
                        ],
                      ),
                      verticalSpacing(SizeConfig.screenHeight! * .05),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return !context.read<LoginCubit>().loadingLogin
                              ? Container(
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.screenHeight! * .01),
                                  width: double.infinity,
                                  height: SizeConfig.screenHeight! * .08,
                                  child: AppButtonText(
                                    backGroundColor:
                                        ColorManger.loginButtonColorBlue,
                                    butonText: S.of(context).login,
                                    onPressed: () async {
                                      validateThenDoLogin(context);
                                    },
                                    textStyle: TextStyles.font15WhiteBold,
                                  ),
                                )
                              : MyProgressIndicator(
                                  hight: SizeConfig.screenHeight! * .08,
                                  width: SizeConfig.screenWidth! * .08);
                        },
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
    );
    // : LoginScreenTablet(changeLanguage: changeLanguage);
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }

  @override
  void dispose() {
    //context.read<LoginCubit>().close();
    super.dispose();
  }
}
