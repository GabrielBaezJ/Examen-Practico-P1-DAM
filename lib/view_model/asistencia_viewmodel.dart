import 'package:flutter/material.dart';

import '../model/asistencia_model.dart';

class AsistenciaViewmodel extends ChangeNotifier {
  String? error;

  //metodos
  AsistenciaModelo? calcular(String totalTexto, String asistenciasTexto) {
    final int? total = int.tryParse(totalTexto);
    final int? asistencias = int.tryParse(asistenciasTexto);

    if (total == null || asistencias == null) {
      error = 'Ingrese ambos valores';
      notifyListeners();
      return null;
    }
    if (total <= 0) {
      error = 'El total de clases debe ser mayor a 0';
      notifyListeners();
      return null;
    }
    if (asistencias > total) {
      error = 'Las asistencias no pueden superar el total de clases';
      notifyListeners();
      return null;
    }

    //variable
    double porcentaje = (asistencias / total) * 100;
    String estado;
    if (porcentaje >= 80) {
      estado = 'Habilitado';
    } else if (porcentaje >= 70) {
      estado = 'Advertencia';
    } else {
      estado = 'No habilitado';
    }

    error = null;
    notifyListeners();

    return AsistenciaModelo(
      totalClases: total,
      asistencias: asistencias,
      porcentaje: porcentaje,
      estado: estado,
    );
  }
}
