import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final formPageInputName = find.byKey(const Key('Nombre'));
final formPageInputLastname = find.byKey(const Key('Apellido'));
final formPageInputEmail = find.byKey(const Key('Correo'));
final formPageInputNumeric = find.byKey(const Key('Celular'));
final formPageButtonSubmit = find.text('Enviar');
