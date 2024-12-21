import 'dart:async';
import 'package:dubai_project/components/nav_bar_icon.dart';
import 'package:dubai_project/screens/MapPage/panel_widget.dart';
import 'package:dubai_project/screens/search_page/search_screen.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

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
  final List<Map<String, dynamic>> navItems = [
    {
      'icon': AppIcons.homeTab.svgPicture(),
      'activeIcon': AppIcons.homeSelectedTab.svgPicture(),
      'onTap': () {
        debugPrint('Home tapped');
      },
    },
    {
      'icon': AppIcons.searchTab.svgPicture(),
      'activeIcon': AppIcons.searchSelectedTab.svgPicture(),
      'onTap': () {
        debugPrint('Search tapped');
      },
    },
    {
      'icon': AppIcons.messageTab.svgPicture(),
      'activeIcon': AppIcons.messageSelectedTab.svgPicture(),
      'onTap': () {
        debugPrint('Notifications tapped');
      },
    },
    {
      'icon': AppIcons.profileTab.svgPicture(),
      'activeIcon': AppIcons.profileSelectedTab.svgPicture(),
      'onTap': () {
        debugPrint('Profile tapped');
      },
    },
  ];

  int selectedIndex = 0;
  late String _mapStyleString;

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.json').then((string) {
      _mapStyleString = string;
    });
    super.initState();
    _fetchUserLocation();
  }

  Future<void> _fetchUserLocation() async {
    try {
      final locationData = await Location().getLocation();
      final userLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      final BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/icons/MarkFair.png',
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

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLng(userLocation));
    } catch (e) {
      debugPrint('Error fetching user location: $e');
    }
  }

  void _onNavItemTapped(int index) async {
    // Collapse the panel
    if (_panelController.isPanelOpen) {
      await _panelController.close();
    }

    // Update selected index
    setState(() {
      selectedIndex = index;
    });

    // Delay to let the new screen load
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_panelController.isPanelClosed) {
        _panelController.open();
      }
    });

    // Call onTap function for the nav item
    navItems[index]['onTap']?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _currentLocation ??
                  const LatLng(37.42796133580664, -122.085749655962),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _controller.future.then((value) {
                value.setMapStyle(_mapStyleString);
              });
            },
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Container(
            height: 260,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white70,
                  Color.fromARGB(0, 255, 255, 255),
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            controller: _panelController,
            maxHeight: MediaQuery.of(context).size.height * 0.93,
            minHeight: 134,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            panelBuilder: (controller) => selectedIndex == 0
                ? PanelWidget(controller: controller)
                : selectedIndex == 1
                    ? SearchScreen(controller: controller)
                    : selectedIndex == 2
                        ? Container()
                        : Container(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
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
                      onTap: () => _onNavItemTapped(index),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
