//import 'package:apex/passwordtext.dart';

import 'package:flutter/material.dart';
//import 'passwordtext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../core/helpers/size_config.dart';
import '../../core/widgets/mytextfile.dart';

class ForgetPassword extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const ForgetPassword({super.key, required this.changeLanguage});
  static const rout = '/forgetpassword';

  @override
  State<ForgetPassword> createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController companyText = TextEditingController();
  final TextEditingController emailText = TextEditingController();
  bool lang = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var sendButton = _sendbtn();
    var logoPar = logoBar();
    var logoText = myLogoText();
    var textField = _alltextfiled(sendButton);

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(),
      // drawer: Drawer(
      //   surfaceTintColor:Colors.red ,
      // ),
      body:  Padding(
          padding: SizeConfig().getScreenPadding(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                logoPar,
                Center(
                  child: logoText,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Form(
                  key: formKey,
                  child: textField,
                ),
              ],
            ),
          ),
        ),
      
    );
  }

  logoBar() {
    return ListTile(
      leading: Image.asset(
        "images/small_apex.png",
        fit: BoxFit.fill,
      ),
      trailing: ElevatedButton(
        onPressed: () {
          lang = !lang;
          formKey.currentState!.reset();
        },
        style: ElevatedButton.styleFrom(
          //shape:OutlineInputBorder(borderRadius: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          "English",
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  myLogoText() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        S.of(context).forgetPassword,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  _alltextfiled(Widget btn) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 25, bottom: 20),
          child: Text(S.of(context).dbName),
        ),
        MyTextForm(
            hint: S.of(context).dbName,
            excep: S.of(context).dbName,
            controller: companyText),
        Container(
          padding: const EdgeInsets.only(top: 25, bottom: 20),
          child: Text(S.of(context).email),
        ),
        MyTextForm(
          hint: S.of(context).email,
          excep: S.of(context).email,
          controller: emailText,
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 70.h,
          child: btn,
        ),
      ],
    );
  }

  _sendbtn() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {}
      },
      child: Text(
        S.of(context).send,
        style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
