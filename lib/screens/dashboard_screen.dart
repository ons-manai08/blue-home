import 'package:blue_home/screens/BathScreen.dart';
import 'package:blue_home/screens/GardenScreen.dart';
import 'package:blue_home/screens/KitchenScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/AuthService.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedTabIndex = 0; // Index for selected tab

  final List<Widget> _tabWidgets = [
    GardenScreen(status: 1,),
    KitchenScreen(),
    BathScreen(status: 4,),
  ];

  final List<String> _tabTitles = [
    'Garden Management',
    'Kitchen',
    'Bath',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FirstNameSection(connectedDevices: 5),
            SizedBox(height: 20),
            _buildConnectedDevicesSection(),
            SizedBox(height: 20),
            Expanded(
              child: _tabWidgets[_selectedTabIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildConnectedDevicesSection() {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildDeviceIcon(Icons.grass_outlined, 'Garden', 0), // Tab 0
          SizedBox(width: 22),
          _buildDeviceIcon(Icons.kitchen_outlined, 'Kitchen', 1), // Tab 1
          SizedBox(width: 22),
          _buildDeviceIcon(Icons.shower_outlined, 'Bath', 2), // Tab 2
        ],
      ),
    );
  }

  Widget _buildDeviceIcon(IconData icon, String label, int tabIndex) {
    bool isSelected = _selectedTabIndex == tabIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = tabIndex; // Met à jour l'onglet sélectionné
        });
      },
      child: Container(
        width: 67,
        height: 100,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 67,
                height: 67,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 18.5,
              top: 17,
              child: Icon(
                icon,
                color: isSelected ? Colors.blueAccent : Colors.grey, // Icone bleu si sélectionné, sinon gris
                size: 32,
              ),
            ),
            Positioned(
              left: 9,
              top: 83,
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.blueAccent : Color(0xFF6F7EA8), // Texte bleu si sélectionné, sinon gris
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBottomNavigationBar() {
    return Container(
      height: 68,
      decoration: ShapeDecoration(
        color: Color(0xFF2E79E6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0C3880F6),
            blurRadius: 30.43,
            offset: Offset(0, 10.46),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavIcon(Icons.home, '/dashboard'),
          _buildNavIcon(Icons.bar_chart, '/statistics'),
          _buildNavIcon(Icons.notifications, '/history'),
          _buildNavIcon(Icons.settings, '/settings'),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, String route) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: () => Get.toNamed(route),
    );
  }
}

class FirstNameSection extends StatefulWidget {
  final int connectedDevices;

  FirstNameSection({required this.connectedDevices});

  @override
  _FirstNameSectionState createState() => _FirstNameSectionState();
}

class _FirstNameSectionState extends State<FirstNameSection> {
  String? _firstName;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _loadUserFirstName();
  }

  Future<void> _loadUserFirstName() async {
    try {
      String? firstName = await _authService.getUserFirstName();
      setState(() {
        _firstName = firstName ?? 'User';
      });
    } catch (e) {
      setState(() {
        _firstName = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.85,
      height: height * 0.15,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: width * 0.85,
              height: height * 0.15,
              decoration: ShapeDecoration(
                color: Color(0xFF2E79E6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x0C3880F6),
                    blurRadius: 30.43,
                    offset: Offset(0, 10.46),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 8.64,
            child: Container(
              width: width * 0.85 - 16,
              height: height * 0.1,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Color(0xFF3D86F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x0C3880F6),
                    blurRadius: 30.43,
                    offset: Offset(0, 10.46),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _firstName ?? 'Loading...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 14,
            top: height * 0.12,
            child: Container(
              width: width * 0.85 - 28,
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: ShapeDecoration(
                          color: Color(0xFF3D86F7),
                          shape: OvalBorder(),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${widget.connectedDevices} Connected Devices',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.notifications_active, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
