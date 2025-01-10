import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final activePage = StateProvider<Pages>((ref) => Pages.home);
final selectedIndexProvider = StateProvider<int>((ref) => 0);
final storeId = StateProvider<int>((ref) => 0);
final isNavProvider = StateProvider<bool>((ref) => true);
final dataLoaded = StateProvider<bool>((ref) => false);
final productId = StateProvider<int>((ref) => 0);
final orgId = StateProvider<int>((ref) => 0);

final navItemsProvider = Provider<List<Map<String, dynamic>>>((ref) => [
      {
        'icon': AppIcons.homeTab.svgPicture(),
        'activeIcon': AppIcons.homeSelectedTab.svgPicture(),
      },
      {
        'icon': AppIcons.searchTab.svgPicture(),
        'activeIcon': AppIcons.searchSelectedTab.svgPicture(),
      },
      {
        'icon': AppIcons.fInactive.svgPicture(),
        'activeIcon': AppIcons.f.svgPicture(),
      },
      {
        'icon': AppIcons.messageTab.svgPicture(),
        'activeIcon': AppIcons.messageSelectedTab.svgPicture(),
      },
      {
        'icon': AppIcons.profileTab.svgPicture(),
        'activeIcon': AppIcons.profileSelectedTab.svgPicture(),
      },
    ]);

final onNavItemTappedProvider =
    Provider<void Function(PanelController, WidgetRef, int)>((ref) {
  return (PanelController panelController, WidgetRef ref, int index) async {
    await panelController.close();

    ref.read(selectedIndexProvider.notifier).update((state) => index);
    ref.read(isNavProvider.notifier).update((state) => true);

    if (panelController.isPanelClosed && index == 2 ||
        panelController.isPanelClosed && index == 3) {
      panelController.open();
    } else {
      panelController.animatePanelToPosition(0.7);
    }
  };
});
void scrollToTop(ScrollController controller) {
  controller.animateTo(
    0.0,
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}

final onItemTappedProvider = Provider<
    void Function(
        PanelController, ScrollController, WidgetRef, Pages, int, int)>((ref) {
  return (PanelController panelController, ScrollController scrollController,
      WidgetRef ref, Pages page, int stID, int? prID) async {
    await panelController.close();


    await scrollController.animateTo(
    0.0,
    duration: Duration(milliseconds: 10),
    curve: Curves.easeInOut,
  );
    ref.read(activePage.notifier).update((state) => page);
    ref.read(isNavProvider.notifier).update((state) => false);
    ref.read(storeId.notifier).update((state) => stID);
    ref.read(productId.notifier).update((state) => prID ?? 0);
    if (ref.watch(activePage) == Pages.paymentInfo ||
        ref.watch(activePage) == Pages.storyOfTheDay) {
      panelController.open();
    } else {
      if (ref.watch(dataLoaded)) {
        panelController.animatePanelToPosition(0.7, duration: Duration(milliseconds: 400));
      }
    }
  };
});
