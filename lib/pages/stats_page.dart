import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ship_tracker/components/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final List<String> dias = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];
  final List<int> completados = [8, 6, 7, 10, 12, 8, 4];
  final List<int> pendientes = [3, 2, 4, 3, 5, 2, 1];
  final List<int> cancelados = [1, 1, 2, 1, 1, 0, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
          backgroundColor: const Color(0xFF15A77F),
          foregroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Estadísticas',
            style: GoogleFonts.archivoBlack(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pedidos (últimos 7 días)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 250,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 15,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 32,
                          interval: 5,
                          getTitlesWidget: (value, meta) => Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index >= 0 && index < dias.length) {
                              return Text(
                                dias[index],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData:
                        FlGridData(show: true, drawVerticalLine: false),
                    borderData: FlBorderData(show: false),
                    barGroups: List.generate(dias.length, (i) {
                      return BarChartGroupData(
                        x: i,
                        barsSpace: 4,
                        barRods: [
                          BarChartRodData(
                            toY: completados[i].toDouble(),
                            color: const Color(0xFF15A77F),
                            width: 10,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          BarChartRodData(
                            toY: pendientes[i].toDouble(),
                            color: const Color(0xFF00BCD4),
                            width: 10,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          BarChartRodData(
                            toY: cancelados[i].toDouble(),
                            color: const Color(0xFFF44336),
                            width: 10,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Cuadros de métricas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _MetricCard(
                    color: Color(0xFF15A77F),
                    icon: Icons.check,
                    title: 'Completadas',
                    value: '35',
                  ),
                  _MetricCard(
                    color: Color(0xFF00BCD4),
                    icon: Icons.hourglass_bottom,
                    title: 'Pendientes',
                    value: '15',
                  ),
                  _MetricCard(
                    color: Color(0xFFF44336),
                    icon: Icons.close,
                    title: 'Canceladas',
                    value: '8',
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Gráfico de Tasa de Éxito
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Tasa de éxito',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          'Últimos 5 meses',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 160,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: Colors.grey.withOpacity(0.2),
                              strokeWidth: 1,
                            ),
                          ),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 28,
                                getTitlesWidget: (value, meta) {
                                  if (value % 10 == 0 && value >= 70) {
                                    return Text(
                                      value.toInt().toString(),
                                      style:
                                          const TextStyle(fontSize: 10),
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 1,
                                getTitlesWidget: (value, meta) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return const Text('Oct',
                                          style:
                                              TextStyle(fontSize: 10));
                                    case 1:
                                      return const Text('Nov',
                                          style:
                                              TextStyle(fontSize: 10));
                                    case 2:
                                      return const Text('Dic',
                                          style:
                                              TextStyle(fontSize: 10));
                                    case 3:
                                      return const Text('Ene',
                                          style:
                                              TextStyle(fontSize: 10));
                                    case 4:
                                      return const Text('Feb',
                                          style:
                                              TextStyle(fontSize: 10));
                                    default:
                                      return const SizedBox();
                                  }
                                },
                              ),
                            ),
                            topTitles: const AxisTitles(
                                sideTitles:
                                    SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(
                                sideTitles:
                                    SideTitles(showTitles: false)),
                          ),
                          borderData: FlBorderData(show: false),
                          minY: 65,
                          maxY: 105,
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              color: const Color(0xFF15A77F),
                              barWidth: 3,
                              dotData: FlDotData(show: true),
                              belowBarData:
                                  BarAreaData(show: false),
                              spots: const [
                                FlSpot(0, 70),
                                FlSpot(1, 85),
                                FlSpot(2, 78),
                                FlSpot(3, 90),
                                FlSpot(4, 100),
                              ],
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

      // 🟩 Barra inferior
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }
}

// Widget auxiliar para los cuadros de métricas
class _MetricCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String value;

  const _MetricCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
