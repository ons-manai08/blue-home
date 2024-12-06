import 'package:blue_home/widgets/ChartData.dart';
import 'package:blue_home/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Ajout d'un défilement
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Conteneur pour les statistiques
              Container(
                width: double.infinity, // Utilisation de l'espace disponible
                height: 108.67,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatsBox('Humidity', '50%', Icons.cloud_outlined),
                    _buildStatsBox('Temperature', '33°C', Icons.thermostat_outlined),
                    _buildStatsBox('Saved Water', '30L', Icons.water_outlined),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Conteneur pour le graphique
              Container(
                width: double.infinity, // Utilisation de l'espace disponible
                height: 297,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19.02),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x423880F6),
                      blurRadius: 11.50,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChartWidget(_createSampleData().cast<charts.Series<ChartData, String>>()), // Affichage du graphique
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Conteneur pour les autres données statistiques
              Container(
                width: double.infinity, // Utilisation de l'espace disponible
                height: 172.13,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 172.13,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 178.50,
                                height: 172.13,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF2666DE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.02),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x423880F6),
                                      blurRadius: 36,
                                      offset: Offset(0, 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20.01,
                              top: 28,
                              child: Container(
                                width: 143.87,
                                height: 124,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 32,
                                      child: SizedBox(
                                        width: 143.87,
                                        height: 26,
                                        child: Text(
                                          '10 Litres',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 23,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0.95,
                                      top: 100,
                                      child: Container(
                                        width: 60.03,
                                        height: 24,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 28.58,
                                              top: 3,
                                              child: SizedBox(
                                                width: 31.44,
                                                height: 15,
                                                child: Text(
                                                  '2.3%',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 22.87,
                                                height: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 3.81,
                                      top: 0,
                                      child: SizedBox(
                                        width: 83.85,
                                        height: 33,
                                        child: Text(
                                          'Today',
                                          style: TextStyle(
                                            color: Color(0xFFECF1FD),
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 31),
                    Expanded(
                      child: Container(
                        height: 172.13,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 178.50,
                                height: 172.13,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.02),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x1E3981F6),
                                      blurRadius: 30.43,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 28,
                              child: Container(
                                width: 112.86,
                                height: 124,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 2.86,
                                      top: 32.33,
                                      child: Text(
                                        '200 Litres',
                                        style: TextStyle(
                                          color: Color(0xFF07123C),
                                          fontSize: 23,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 100,
                                      child: Container(
                                        width: 60.14,
                                        height: 24,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 28.64,
                                              top: 3,
                                              child: SizedBox(
                                                width: 31.50,
                                                height: 15,
                                                child: Text(
                                                  '2.3%',
                                                  style: TextStyle(
                                                    color: Color(0xFF07123C),
                                                    fontSize: 13,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 22.91,
                                                height: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 2.86,
                                      top: 0,
                                      child: SizedBox(
                                        width: 101.18,
                                        height: 33,
                                        child: Text(
                                          'Last Month',
                                          style: TextStyle(
                                            color: Color(0xFF6F7EA8),
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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

  // Exemple de données pour le graphique
  List<charts.Series<ChartData, String>> _createSampleData() {
    final data = [
      ChartData('Jan', 5),
      ChartData('Feb', 25),
      ChartData('Mar', 100),
      ChartData('Apr', 75),
    ];

    return [
      charts.Series<ChartData, String>(
        id: 'Sales',
        domainFn: (ChartData sales, _) => sales.month,
        measureFn: (ChartData sales, _) => sales.value,
        data: data,
      ),
    ];
  }

  // Widget pour afficher une boîte de statistiques
  Widget _buildStatsBox(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xFF4F81D1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: 4),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

