import 'package:flutter_test/flutter_test.dart';
import 'package:app_demo/login.dart'; 
import 'package:app_demo/formulario.dart';   
import '../../finder/login_page.dart';
import '../../helpers/widget_test_utils.dart';
import '../../utils/user_constants.dart';

void main() {

  testWidgets('LoginScreen muestra campos y botón', (tester) async {
    await pumpApp(tester, const LoginScreen());

    expect(loginPageInputUsername, findsOneWidget);
    expect(loginPageInputPassword, findsOneWidget);
    expect(loginPageButtonLogin, findsOneWidget);
  });

  testWidgets('Login con credenciales vacías muestra snackbar', (tester) async {
    await pumpApp(tester, const LoginScreen());

    await tester.tap(loginPageButtonLogin);
    await tester.pump(); 

    expect(find.text('Credenciales vacias'), findsOneWidget);
  });

  testWidgets('Login con credenciales incorrectas muestra snackbar', (tester) async {
    await pumpApp(tester, const LoginScreen());

    await tester.enterText(loginPageInputUsername, usernameFailure);
    await tester.enterText(loginPageInputPassword, passwordFailure);
    await tester.tap(loginPageButtonLogin);
    await tester.pump();

    expect(find.text('Credenciales incorrectas'), findsOneWidget);
  });

  testWidgets('Login correcto navega a MyForm', (tester) async {
    await pumpApp(tester, const LoginScreen());

    await tester.enterText(loginPageInputUsername, usernameSuccess);
    await tester.enterText(loginPageInputPassword, passwordSuccess);
    await tester.tap(loginPageButtonLogin);
    await tester.pumpAndSettle(); 

    expect(find.byType(MyForm), findsOneWidget);
  });
}
