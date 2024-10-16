import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_cubit.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "${S.of(context).welcome} , ",
            style: TextStyles.font16BlackBold),
        TextSpan(
            text: Intl.defaultLocale == arabic
                ? context.read<HomeCubit>().data.empArabicName
                : context.read<HomeCubit>().data.empLatinName,
            style: TextStyles.font16BlueBold)
      ]),
    );
  }
}
