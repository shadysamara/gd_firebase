import 'package:flutter/material.dart';

class RouterHelper {
  RouterHelper._();
  static RouterHelper routerHelper = RouterHelper._();
  GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();
  routingToSpecificWidget(Widget widget) {
    BuildContext context = routerKey.currentState.context;
    routerKey.currentState
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  routingToSpecificWidgetWithoutPop(Widget widget) {
    BuildContext context = routerKey.currentState.context;
    routerKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
