import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/shimmer_widgets/home_shimmer.dart';
import 'package:ttech_attendance/core/widgets/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/my_app_bar_tablet.dart';
import 'package:ttech_attendance/core/widgets/my_drawer.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_cubit.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_state.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/header_block_listener.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/quick_access_tablet.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/welcome_widget.dart';

import 'widgets/attendance_log.dart';
import 'widgets/events_approvals.dart';
import 'widgets/quick_access.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const HomeScreen({super.key, required this.changeLanguage});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String token='';


  @override
  void initState() {
    super.initState();
    // get token from shared preference and set it on variable token
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveBreakpoints.of(context).isMobile
          ? MyAppBar(
              changeLanguage: widget.changeLanguage,
              context: context,
              title: "")
          : MyAppBarTablet(
              changeLanguage: widget.changeLanguage,
              context: context,
              tiltle: ""),
      drawer: const Drawer(child: MyDrawer()),
      body: OfflineBuilderWidget(
        child: SafeArea(
          child: SingleChildScrollView(

              child: Column(
                children: [
                  // set attendance data on first size box
                  const HeaderBlockListener(),


                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return  const HomeShimmer();
                      }
                        return Padding(
                          key: context.read<HomeCubit>().formKey,
                          padding: EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth! * .01,vertical: SizeConfig.screenHeight! * .01),
                          child: Column(
                            children: [
                              verticalSpacing(
                                  SizeConfig.screenHeight! * .01),
                               const WelcomeWidget()
                                  ,
                              verticalSpacing(
                                  SizeConfig.screenHeight! * .01),
                              const AttendanceLog()
                                  ,
                              verticalSpacing(
                                  SizeConfig.screenHeight! * .01),
                              ResponsiveBreakpoints.of(context).isMobile
                                  ? const QuickAccess()
                                  : const QuickAccessTablet(),
                              verticalSpacing(
                                  SizeConfig.screenHeight! * .01),
                             const EventsApprovals()
                                 ,
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    SizedBox(
                                      height:
                                      SizeConfig.screenWidth! * .1,
                                      width:
                                      SizeConfig.screenHeight! * .1,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.blue,
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.add,
                                          size:
                                          SizeConfig.screenHeight! *
                                                  .05,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.menu_open_sharp,
                                      size:
                                         SizeConfig.screenHeight! * .1,
                                      color: Colors.blue,
                                    ),
                                  ]),
                            ],
                          ),
                        );
                      }

                  ),
                ],
              ),
            ),
          ),
        ),
      );

  }

  getToken() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString(myToken)!;
    setState(() {
      getHeader(context);
    });
  }

  getHeader(BuildContext context) {
    context.read<HomeCubit>().emitHomeState("$myBearer $token");
  }
}

