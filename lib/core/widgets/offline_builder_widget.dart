
import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';

class OfflineBuilderWidget extends StatelessWidget {
  final MaterialApp materialApp;
  const OfflineBuilderWidget({super.key, required this.materialApp});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InternetWidget(
        offline: FullScreenWidget(
          child: Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/no-wifi.png",
                  scale: 3,
                ),
                Text(Intl.defaultLocale == MyConstants.arabic
                    ? "لا يوجد اتصال بالإنترنت، تحقق من الاتصال وحاول مرة أخرى."
                    : "No internet , check your connection and try again"),
              ],
            )),
          ),
        ),
        // ignore: avoid_print
        whenOffline: () => print('No Internet'),
        // ignore: avoid_print
        whenOnline: () => print('Connected to internet'),
        loadingWidget: const Center(child: Text('Loading')),
        online: materialApp);
  }
}
