import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/shimmer_widgets/home_shimmer_tablet.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar_tablet.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drower_tablet.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_cubit.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_state.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/attendance_log_tablet.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/events_approvals_tablet.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/header_block_listener.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/quick_access_tablet.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/welcome_widget_tablet.dart';

class HomeScreenTablet extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const HomeScreenTablet({super.key, required this.changeLanguage});

  @override
  State<HomeScreenTablet> createState() => _HomeScreenTabletState();
}

class _HomeScreenTabletState extends State<HomeScreenTablet> {
  String token = '';

  @override
  void initState() {
    super.initState();
    // get token from shared preference and set it on variable token
    getHeader(context);
  }

  Future<void> _refreshData() async {
    // Simulate a network request or other asynchronous task
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      getHeader(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarTablet(
        changeLanguage: widget.changeLanguage,
        context: context,
        title: "",
      ),
      drawer: const Drawer(
        child: MyDrowerTablet(),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // set attendance data on first size box
                const HeaderBlockListener(),

                BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                  if (state is Loading) {
                    return const HomeShimmerTablet();
                  }
                  return Padding(
                    key: context.read<HomeCubit>().formKey,
                    padding: SizeConfig().getScreenPadding(),
                    child: Column(
                      children: [
                        verticalSpacing(SizeConfig.screenHeight! * .01),
                        const WelcomeWidgetTablet(),
                        verticalSpacing(SizeConfig.screenHeight! * .01),
                        const AttendanceLogTablet(),
                        verticalSpacing(SizeConfig.screenHeight! * .01),
                        const QuickAccessTablet(),
                        verticalSpacing(SizeConfig.screenHeight! * .01),
                        const EventsApprovalsTablet(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              SizedBox(
                                height: SizeConfig.screenWidth! * .1,
                                width: SizeConfig.screenHeight! * .1,
                                child: FloatingActionButton(
                                  backgroundColor: ColorManger.darkBlue,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.add,
                                    size: SizeConfig.screenHeight! * .05,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.menu_open_sharp,
                                size: SizeConfig.screenHeight! * .1,
                                color: ColorManger.darkBlue,
                              ),
                            ]),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getHeader(BuildContext context) {
    context.read<HomeCubit>().emitHomeState();
  }
}
