// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';

// class OfflineBuilderWidget extends StatelessWidget {
//   final Widget child;
//   const OfflineBuilderWidget({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return OfflineBuilder(
//       connectivityBuilder: (BuildContext context,
//           List<ConnectivityResult> connectivity, Widget child2) {
//         final bool connected = !connectivity.contains(ConnectivityResult.none);
//         return SafeArea(
//           child: Stack(
//             children: [
//               connected ? child : child2,
//             ],
//           ),
//         );
//       },
//       child: SizedBox(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(flex: 2, child: Image.asset("images/no_internet.gif")),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';

class OfflineBuilderWidget extends StatelessWidget {
  final MaterialApp materialApp;
  const OfflineBuilderWidget({super.key, required this.materialApp});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InternetWidget(
      offline: FullScreenWidget(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('No Internet Example'),
          ),
          body: const Center(child: Text('No Internet')),
        ),
      ),
      // ignore: avoid_print
      whenOffline: () => print('No Internet'),
      // ignore: avoid_print
      whenOnline: () => print('Connected to internet'),
      loadingWidget: const Center(child: Text('Loading')),
      //offline: const Center(child: Text('No Internet')),
      online: materialApp
    );
  }
}
