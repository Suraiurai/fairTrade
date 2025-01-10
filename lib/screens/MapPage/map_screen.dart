import 'package:dubai_project/components/nav_bar_icon.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/screens/HomePage/UI/panel_widget.dart';
import 'package:dubai_project/screens/MapPage/map_vm.dart';
import 'package:dubai_project/screens/OrganizationPage/organization_scree.dart';
import 'package:dubai_project/screens/ProductPage/product_info_page.dart';
import 'package:dubai_project/screens/ProductProofPage/product_proof_screen.dart';
import 'package:dubai_project/screens/ProfilePage/profile_screen.dart';
import 'package:dubai_project/screens/StorePage/store_screen.dart';
import 'package:dubai_project/screens/search_page/search_screen.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/enums.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:async';

import '../AIHelperPage/ai_helper_screen.dart';
import '../PaymentPage/payment_screen.dart';
import '../StoryPage/story_of_the_day_screen.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final PanelController _panelController = PanelController();
  LatLng? _currentLocation;
  final Set<Marker> _markers = {};
  late String _mapStyleString;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _fetchUserLocation();
  }

  void _loadMapStyle() async {
    _mapStyleString =
        await rootBundle.loadString('assets/jsons/map_style.json');
  }

  Future<void> _fetchUserLocation() async {
    try {
      final location = Location();
      final hasPermission = await location.hasPermission();
      if (hasPermission == PermissionStatus.denied) {
        await location.requestPermission();
      }

      final locationData = await location.getLocation();
      if (locationData.latitude != null && locationData.longitude != null) {
        final userLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
        final BitmapDescriptor customIcon =
            await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(186, 186)),
          'assets/icons/markN.png',
        );

        setState(() {
          _currentLocation = userLocation;
          _markers.add(
            Marker(
              markerId: const MarkerId('user_location'),
              icon: customIcon,
              position: userLocation,
              infoWindow: const InfoWindow(title: 'Your Location'),
            ),
          );
        });

        final controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newLatLng(userLocation));
      }
    } catch (e) {
      debugPrint('Error fetching user location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // GoogleMap(
          //   mapType: MapType.normal,
          //   initialCameraPosition: CameraPosition(
          //     target: _currentLocation ??
          //         const LatLng(37.42796133580664, -122.085749655962),
          //     zoom: 14.4746,
          //   ),
          //   onMapCreated: (controller) {
          //     _controller.complete(controller);
          //     controller.setMapStyle(_mapStyleString);
          //   },
          //   markers: _markers,
          //   myLocationEnabled: true,
          //   myLocationButtonEnabled: true,
          // ),
          Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.99),
                  Colors.white.withOpacity(0.95),
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.70),
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.0),
                  Color.fromARGB(0, 255, 255, 255),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: Container(
                  width: 84,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.p1.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40),
                      border:
                          Border.all(width: 1, color: AppColors.whiteCustom)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AllText(
                          text: "250",
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.p1),
                      const SizedBox(width: 10),
                      SizedBox(
                          width: 24, height: 24, child: AppIcons.f.svgPicture())
                    ],
                  ),
                ),
              ),
            ),
          ),
          SlidingUpPanel(
            controller: _panelController,
            maxHeight: ref.watch(selectedIndexProvider) == 2 || ref.watch(selectedIndexProvider) == 3
                ? 407 : ref.watch(activePage) == Pages.paymentInfo ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.height * 0.86,
            minHeight: 130,
            color: Colors.white,
            boxShadow: [],
            borderRadius: BorderRadius.circular(30),
            panelBuilder: (controller) {
              if (ref.watch(isNavProvider)) {
                return _buildPanelContent(controller);
              } else {
                return ref.watch(activePage) == Pages.storeInfo
                    ? StoreScreen(
                        controller: controller,
                        panelController: _panelController,
                        id: ref.watch(storeId),
                      )
                    : ref.watch(activePage) == Pages.productInfo
                        ? ProductInfoScreen(
                            controller: controller,
                            id: ref.watch(storeId),
                            ind: ref.watch(productId),
                            panelcontroller: _panelController)
                        : ref.watch(activePage) == Pages.organizationInfo
                            ? OrganizationPage(
                                controller: controller,
                                panelController: _panelController,
                                id: ref.watch(storeId)) : ref.watch(activePage) == Pages.paymentInfo ? PaymentPage()
                            : StoryOfTheDay(
                                controller: controller,
                                panelController: _panelController,
                              );
              }
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildPanelContent(ScrollController controller) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    if (selectedIndex == 0) {
      return PanelWidget(
        controller: controller,
        panelController: _panelController,
      );
    } else if (selectedIndex == 1) {
      return SearchScreen(
        controller: controller,
        panelcontroller: _panelController,
      );
    } else if (selectedIndex == 2) {
      return ProductProof(
        controller: controller,
      );
    } else if (selectedIndex == 3) {
      return AIHelperScreen();
    } else {
      return ProfileScreen(controller: controller);
    }
  }

  Widget _buildBottomNavigationBar() {
    final navItems = ref.watch(navItemsProvider);
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Container(
      width: double.infinity,
      height: 83,
      decoration: BoxDecoration(
        color: AppColors.light100,
        border: Border.all(width: 1, color: AppColors.light400),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          navItems.length,
          (index) {
            final item = navItems[index];
            return NavBarIcon(
              icon: item['icon'],
              activeIcon: item['activeIcon'],
              active: selectedIndex == index,
              onTap: () => ref.read(onNavItemTappedProvider)(
                  _panelController, ref, index),
            );
          },
        ),
      ),
    );
  }
}
