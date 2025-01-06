import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final activePage = StateProvider<Pages>((ref) => Pages.home);
final selectedIndexProvider = StateProvider<int>((ref) => 0);
final storeId = StateProvider<int>((ref) => 0);
final isNavProvider = StateProvider<bool>((ref) => true);
final dataLoaded = StateProvider<bool>((ref) => false);

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


final onNavItemTappedProvider = Provider<void Function(PanelController, WidgetRef, int)>((ref) {
  return (PanelController panelController, WidgetRef ref, int index) async {
    if (panelController.isPanelOpen) {
      await panelController.close();
    }
    ref.read(selectedIndexProvider.notifier).update((state) => index);
     ref.read(isNavProvider.notifier).update((state) => true);
    Future.delayed(const Duration(milliseconds: 150), () {
      if (panelController.isPanelClosed) {
        panelController.open();
      }
    });
  };
});


final onItemTappedProvider = Provider<void Function(PanelController, WidgetRef, Pages, int)>((ref) {
  return (PanelController panelController, WidgetRef ref,  Pages page, int id ) async {
    // if (panelController.isPanelOpen) {
      await panelController.close();
    // }
    ref.read(activePage.notifier).update((state) => page); 
    ref.read(isNavProvider.notifier).update((state) => false);
    ref.read(storeId.notifier).update((state) => id);
    // Future.delayed(const Duration(milliseconds: 150), () {
      if (ref.watch(dataLoaded)) {
        panelController.open();
      }
    // });
  };
});
