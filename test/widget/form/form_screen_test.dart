import 'package:flutter_test/flutter_test.dart';
import 'package:app_demo/formulario.dart';
import '../../finder/form_page.dart';
import '../../helpers/widget_test_utils.dart';

void main() {
  testWidgets('Formulario muestra todos los campos', (tester) async {
    await pumpApp(tester, const MyForm());

    expect(formPageInputName, findsOneWidget);
    expect(formPageInputLastname, findsOneWidget);
    expect(formPageInputEmail, findsOneWidget);
    expect(formPageInputNumeric, findsOneWidget);
    expect(formPageButtonSubmit, findsOneWidget);
  });

  testWidgets('Formulario muestra errores si se presiona sin rellenar',
      (tester) async {
    await pumpApp(tester, const MyForm());

    await tester.tap(formPageButtonSubmit);
    await tester.pump();

    expect(find.text('Por favor, ingrese su nombre'), findsOneWidget);
    expect(find.text('Por favor, ingrese su apellido'), findsOneWidget);
    expect(
        find.text('Por favor, ingrese su correo electrónico'), findsOneWidget);
    expect(find.text('Por favor, ingrese su celular'), findsOneWidget);
  });

  testWidgets('Formulario muestra error si el correo es inválido',
      (tester) async {
    await pumpApp(tester, const MyForm());

    await tester.enterText(formPageInputName, 'Juan');
    await tester.enterText(formPageInputLastname, 'Pérez');
    await tester.enterText(formPageInputEmail, 'correo_sin_arroba');
    await tester.enterText(formPageInputNumeric, '1234567890');

    await tester.tap(formPageButtonSubmit);
    await tester.pump();

    expect(find.text('Correo electrónico no válido'), findsOneWidget);
  });

  testWidgets('Formulario exitoso muestra SnackBar con los datos',
      (tester) async {
    await pumpApp(tester, const MyForm());

    await tester.enterText(formPageInputName, 'Ana');
    await tester.enterText(formPageInputLastname, 'López');
    await tester.enterText(formPageInputEmail, 'ana@correo.com');
    await tester.enterText(formPageInputNumeric, '1234567890');

    await tester.tap(formPageButtonSubmit);
    await tester.pump();

    expect(find.textContaining('Nombre: Ana'), findsOneWidget);
    expect(find.textContaining('Apellido: López'), findsOneWidget);
    expect(find.textContaining('Correo Electrónico: ana@correo.com'),
        findsOneWidget);
    expect(find.textContaining('Celular: 1234567890'), findsOneWidget);
  });
}
