<h1 align="center">
  <br>
  <a href="http://www.amitmerchant.com/electron-markdownify"><img src="https://f.hubspotusercontent20.net/hubfs/2829524/Copia%20de%20LOGOTIPO_original-2.png"></a>
  <br>
  qa-mobile-flutter-widget-test
  <br>
</h1>

Este proyecto muestra cómo estructurar y ejecutar **pruebas de widget** en Flutter, incluyendo navegación, validaciones de formulario y mensajes en pantalla.

---

## 📁 Estructura del proyecto

```
lib/
├── login.dart
└── formulario.dart

test/
├── widget/
│   ├──login/
│   │   └── login_screen_test.dart
│   └──form/
│       └── form_screen_test.dart   
│
├── finder/
│   ├── form_page.dart
│   └── login_page.dart
│
├── utils/
│   └── user_constants.dart
│
└── helpers/
    └── widget_test_utils.dart
```

---

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

## 🧾 Requisitos

- Flutter 3.x o superior
- Dependencias por defecto (`flutter_test` incluida)

---

## 💡 Recomendaciones

- Usa `Key` en tus widgets para facilitar las búsquedas en pruebas.


---

## 📚 Recursos útiles

- [Pruebas en Flutter (oficial)](https://docs.flutter.dev/testing)


---

## 👨‍💻 Autor

 [<img src="https://secure.gravatar.com/avatar/23b2db02403d79ebd356e8e8356758ec?s=192&d=identicon" width=115><br><sub>Marcos Silva</sub>](https://gitlab.com/)