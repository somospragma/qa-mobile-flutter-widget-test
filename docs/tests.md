## 🧪 Ejecutar pruebas

```bash
flutter test
```

### Ejecutar prueba individual

```bash
flutter test test/widget/login_screen_test.dart
```

### Mostrar salida detallada

```bash
flutter test --reporter expanded
```

---

## 🧰 Utilidades para pruebas

En `test/helpers/widget_test_utils.dart` definimos un helper común:

```dart
Future<void> pumpApp(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(
    MaterialApp(home: widget),
  );
```

Esto te permite testear cualquier widget que dependa de `MaterialApp` sin repetir código.

---

## ✅ Pruebas cubiertas

### 🔐 LoginScreen
- Campos visibles: usuario y contraseña.
- Validación de campos vacíos e incorrectos.
- Navegación a `MyForm` al ingresar credenciales correctas.

### 📝 MyForm
- Validación de nombre, apellido, correo y celular.
- Verificación de correo inválido.
- Muestra `SnackBar` con los datos ingresados si todo es correcto.

---