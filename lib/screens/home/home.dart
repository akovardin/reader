import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 100,
            color: Colors.green,
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    navigatorKey.currentState?.pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => Container(color: Colors.red),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                  child: Text('navigate 1'),
                ),
                OutlinedButton(
                  onPressed: () {
                    navigatorKey.currentState?.pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => Container(color: Colors.tealAccent),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                  child: Text('navigate 2'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Navigator(
                key: navigatorKey,
                onGenerateRoute: (routeSettings) {
                  return PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => Container(color: Colors.tealAccent),
                    transitionDuration: Duration.zero,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
