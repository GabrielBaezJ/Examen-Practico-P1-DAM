import 'package:flutter/material.dart';

import '../../model/asistencia_model.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final datos =
        ModalRoute.of(context)!.settings.arguments as AsistenciaModelo;

    Color color;
    IconData icono;
    if (datos.estado == 'Habilitado') {
      color = Colors.green;
      icono = Icons.check_circle_rounded;
    } else if (datos.estado == 'Advertencia') {
      color = Colors.orange;
      icono = Icons.warning_rounded;
    } else {
      color = Colors.red;
      icono = Icons.cancel_rounded;
    }

    return Scaffold(
      backgroundColor: Color(0xFFF2F4FA),
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Color(0xFF3949AB),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(28),
                child: Column(
                  children: [
                    Text(
                      '${datos.porcentaje.toStringAsFixed(2)} %',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(icono, color: color, size: 28),
                          SizedBox(width: 8),
                          Text(
                            datos.estado,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 28),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.menu_book_rounded,
                        color: Color(0xFF3949AB),
                      ),
                      title: Text('Total de clases'),
                      trailing: Text(
                        '${datos.totalClases}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.how_to_reg_rounded,
                        color: Color(0xFF3949AB),
                      ),
                      title: Text('Asistencias'),
                      trailing: Text(
                        '${datos.asistencias}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
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
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.refresh_rounded),
                label: Text(
                  'Nueva consulta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              ),
              child: Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
