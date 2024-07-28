import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/mytextfile.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/core/widgets/passwordtext.dart';
import 'package:ttech_attendance/featchers/login/logic/cubit/login_cubit.dart';
import 'package:ttech_attendance/featchers/login/ui/widget/login_bloc_listener.dart';
import 'package:ttech_attendance/generated/l10n.dart';


class LoginScreenTablet extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const LoginScreenTablet({super.key, required this.changeLanguage});

  @override
  LoginScreenState createState() =>
      // ignore: no_logic_in_create_state
      LoginScreenState(changeLanguage: changeLanguage);
}

class LoginScreenState extends State<LoginScreenTablet> {
  bool rememberMe = false;
  String selectedLanguage = 'English';
  bool circaleLoadFlag = false;
  bool lang = true;
  bool languageButtonPressed = false;
  final Function(Locale) changeLanguage;
  LoginScreenState({required this.changeLanguage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: OfflineBuilderWidget(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
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
                                  borderRadius: BorderRadius.circular(20.r)),
                              fixedSize:
                                  Size(100.w, 110.h), //Size.fromWidth(110.w),

                              backgroundColor: Colors.white,
                            ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                selectedLanguage,
                                style: TextStyles.font22BlueBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          S.of(context).login,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Form(
                      key: context.read<LoginCubit>().formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 25, bottom: 20),
                            child: Text(S.of(context).dbName),
                          ),
                          MyTextForm(
                              hint: S.of(context).dbName,
                              excep: S.of(context).dbName,
                              control: context.read<LoginCubit>().dbController),
                          Container(
                            padding: const EdgeInsets.only(top: 25, bottom: 20),
                            child: Text(S.of(context).email),
                          ),
                          MyTextForm(
                            hint: S.of(context).email,
                            excep: S.of(context).email,
                            control: context.read<LoginCubit>().emailController,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 25, bottom: 20),
                            child: Text(S.of(context).password),
                          ),
                          PasswordText(
                              hint: S.of(context).password,
                              obsecur: true,
                              control: context
                                  .read<LoginCubit>()
                                  .passwordController),
                          SizedBox(
                            height: 50.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  context
                                      .pushNamed(Routes.forgetPasswordSccreen);
                                },
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10.h),
                            width: double.infinity,
                            height: 60.h,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  context.read<LoginCubit>().circaleLoadFlag =
                                      true;
                                });
                                validateThenDoLogin(context);
                              },
                              style: ElevatedButton.styleFrom(),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child:
                                    context.read<LoginCubit>().circaleLoadFlag
                                        ? const CircularProgressIndicator(
                                            color: Colors.purpleAccent,
                                          )
                                        : Text(
                                            S.of(context).login,
                                            style: TextStyles.font22BlueBold,
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
        ));
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
      setState(() {
        context.read<LoginCubit>().circaleLoadFlag = false;
      });
    } else {
      setState(() {
        context.read<LoginCubit>().circaleLoadFlag = false;
      });
    }
  }
}
