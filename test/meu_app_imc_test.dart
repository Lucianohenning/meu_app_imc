import 'package:meu_app_imc/meu_app_imc.dart';
import 'package:test/test.dart';

void main() {
  test('Calcula IMC', () {
    expect(
      calculateImc(80, 1.80),
      24.691358024691358,
    );
  });

  print(calculateImc(80, 1.80));
}
