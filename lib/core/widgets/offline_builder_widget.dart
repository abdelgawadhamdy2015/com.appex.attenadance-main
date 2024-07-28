import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class OfflineBuilderWidget extends StatelessWidget {
  final Widget child;
  const OfflineBuilderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context,
          List<ConnectivityResult> connectivity, Widget child2) {
        final bool connected = !connectivity.contains(ConnectivityResult.none);
        return SafeArea(
          child: Stack(
            children: [
              connected ? child : child2,
            ],
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: 2, child: Image.asset("images/no_internet.gif")),
          ],
        ),
      ),
    );
  }
}
