import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/asistencia_viewmodel.dart';
import '../widgets/campo_numero.dart';

class AsistenciaPantalla extends StatefulWidget {
  AsistenciaPantalla({super.key});

  @override
  State<AsistenciaPantalla> createState() => _AsistenciaPantallaState();
}

class _AsistenciaPantallaState extends State<AsistenciaPantalla> {
  final TextEditingController totalController = TextEditingController();
  final TextEditingController asistenciasController = TextEditingController();

  @override
  void dispose() {
    totalController.dispose();
    asistenciasController.dispose();
    super.dispose();
  }

  void _calcular() {
    final resultado = context.read<AsistenciaViewmodel>().calcular(
      totalController.text,
      asistenciasController.text,
    );
    if (resultado != null) {
      Navigator.pushNamed(context, '/resultados', arguments: resultado);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AsistenciaViewmodel>();

    return Scaffold(
      backgroundColor: Color(0xFFF2F4FA),
      appBar: AppBar(
        title: Text('Datos del estudiante'),
        backgroundColor: Color(0xFF3949AB),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.edit_note_rounded,
                      color: Color(0xFF3949AB),
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Ingrese la información',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                CampoNumero(
                  controller: totalController,
                  etiqueta: 'Total de clases impartidas',
                  icono: Icons.menu_book_rounded,
                ),
                SizedBox(height: 20),
                CampoNumero(
                  controller: asistenciasController,
                  etiqueta: 'Número de asistencias',
                  icono: Icons.how_to_reg_rounded,
                ),
                if (vm.error != null) ...[
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline, color: Colors.red),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            vm.error!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3949AB),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: _calcular,
                    icon: Icon(Icons.calculate_rounded),
                    label: Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
