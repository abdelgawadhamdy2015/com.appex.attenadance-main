//import 'package:apex/passwordtext.dart';

import 'package:flutter/material.dart';
//import 'passwordtext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../core/widgets/mytextfile.dart';

class ForgetPassword extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const ForgetPassword({super.key, required this.changeLanguage});
  static const rout = '/forgetpassword';

  @override
  State<ForgetPassword> createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController companytxt = TextEditingController();
  final TextEditingController emailtxt = TextEditingController();
  bool lang = true;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var sendbutton = _sendbtn();
    var logopar = logoBar();
    var logoText = myLogoText();
    var textfield = _alltextfiled(sendbutton);

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(),
      // drawer: Drawer(
      //   surfaceTintColor:Colors.red ,
      // ),
      body: OfflineBuilderWidget(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                logopar,
                Center(
                  child: logoText,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Form(
                  key: formkey,
                  child: textfield,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  logoBar() {
    return ListTile(
      leading: Image.asset(
        "images/logo (1).jpg",
        fit: BoxFit.fill,
      ),
      trailing: ElevatedButton(
        onPressed: () {
          lang = !lang;
          formkey.currentState!.reset();
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
            control: companytxt),
        Container(
          padding: const EdgeInsets.only(top: 25, bottom: 20),
          child: Text(S.of(context).email),
        ),
        MyTextForm(
          hint: S.of(context).email,
          excep: S.of(context).email,
          control: emailtxt,
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
        if (formkey.currentState!.validate()) {}
      },
      child: Text(
        S.of(context).send,
        style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
