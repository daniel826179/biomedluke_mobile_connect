import 'package:flutter_test/flutter_test.dart';
import 'package:biomedluke_mobile_connect/main.dart';

void main() {
  testWidgets('Prueba de humo de la app Biomedluke', (WidgetTester tester) async {
    // Construye nuestra aplicación y dispara un frame.
    await tester.pumpWidget(const BiomedlukeApp());

    // Verifica que cargue la pantalla de inicio de sesión.
    expect(find.text('Biomedluke Mobile Connect'), findsOneWidget);
  });
}