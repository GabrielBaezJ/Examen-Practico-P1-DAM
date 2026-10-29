import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoNumero extends StatelessWidget {
  final TextEditingController controller;
  final String etiqueta;
  final IconData icono;

  const CampoNumero({
    super.key,
    required this.controller,
    required this.etiqueta,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: Icon(icono),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
