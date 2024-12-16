import 'package:flutter/material.dart';


final rootNavigatorKey = GlobalKey<NavigatorState>();

const Color _kCupertinoPageTransitionBarrierColor = Color(0x18000000);
const Color _kCupertinoModalBarrierColorLight = Color(0x33000000);

class MaterialPageRouteWithBarrier<T> extends MaterialPageRoute<T> {
  MaterialPageRouteWithBarrier({
    required super.builder,
    super.settings,
    super.maintainState = true,
    super.fullscreenDialog,
    super.allowSnapshotting = true,
  });

  @override
  Color? get barrierColor => fullscreenDialog 
      ? _kCupertinoModalBarrierColorLight
      : _kCupertinoPageTransitionBarrierColor;
}

Future<T?> replaceRootScreen<T extends Object?>(BuildContext context, Widget screen) {
  return Navigator.of(context, rootNavigator: true).pushAndRemoveUntil<T?>(
    MaterialPageRouteWithBarrier<T?>(
      builder: (context) => screen,
    ),
    (route) => false,
  );
}

extension NavigatorX on NavigatorState {
  bool isCurrentRouteFirst() {
    var isCurrentRouteFirst = false;
    popUntil((route) {
      isCurrentRouteFirst = route.isFirst;
      return true;
    });
    return isCurrentRouteFirst;
  }
}

Future<T?> navigateToScreen<T extends Object?>(
  BuildContext context,
  Widget screen, {
  bool fullscreenDialog = false,
  bool rootNavigator = false,
}) {
  return Navigator.of(context, rootNavigator: rootNavigator).push<T?>(
    MaterialPageRouteWithBarrier<T?>(
      builder: (context) => screen,
      fullscreenDialog: fullscreenDialog,
    ),
  );
}

void navigateAndRemove<T>(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil<T>(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}
