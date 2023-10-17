import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:meu_app_imc/Classes/Pessoa.dart';
import 'package:meu_app_imc/meu_app_imc.dart' as app_imc;

void main(List<String> arguments) {
//  double peso = 0.0;
  print('Digite seu nome');
  var line = stdin.readLineSync(encoding: utf8);
  var nome = line;
  var peso;

  print('Digite seu peso');
  line = stdin.readLineSync(encoding: utf8);
  try {
    peso = double.parse(line ?? "0");
  } catch (e) {
    print("Valor digitado para peso é inválido.");
    exit(0);
  }

  var altura;
  print('Digite sua altura');
  line = stdin.readLineSync(encoding: utf8);
  try {
    altura = double.parse(line ?? "0");
  } catch (e) {
    print("Valor digitado para altura é inválido.");
    exit(0);
  }

  // var pessoa1 = new Pessoa(nome.getNome(), peso, altura);

  double imc = app_imc.calculateImc(peso, altura);

  if (imc < 16) {
    print("IMC: $imc, muito abaixo magreza grave.");
  } else {
    if (imc < 17) {
      print("IMC: $imc, magreza moderada.");
    } else {
      if (imc <= 18.5) {
        print("IMC: $imc, magreza leve.");
      } else {
        if (imc < 25) {
          print("IMC: $imc, Parabêns! você está saudável.");
        } else {
          if (imc < 30) {
            print("IMC: $imc, atenção! esta com soprepeso.");
          } else {
            if (imc < 35) {
              print("IMC: $imc, Atenção Perigo!, Obesidade Grau I.");
            } else {
              if (imc < 40) {
                print(
                    "IMC: $imc, Atenção Perigo!, Obesidade Grau II (Severa).");
              } else {
                if (imc >= 40) {
                  print(
                      "IMC: $imc, Atenção Perigo!, Obesidade Grau III (Morbida).");
                }
              }
            }
          }
        }
      }
    }
  }
}
