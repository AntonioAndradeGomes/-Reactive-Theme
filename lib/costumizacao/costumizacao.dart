import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Costumizacao {

  String tema;//variavel que irá conter o valor

  Costumizacao(){//contrutor que chama a função assincrona que pega o valor do tema
    iniciarTema();
  }

  Future<String> iniciarTema() async{//pegar o valor do tema, colocar na variavel tema acima e depois retornar esse valor
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.tema = prefs.getString('TemaAtual');
    return tema;
  }

  void setTema(String tema) async{//função que muda o valor do tema
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('TemaAtual', tema);
    iniciarTema();
  }

  int getValorTema(){
    if (tema == 'TemaA') {
      return 1;
    } else if (tema == 'TemaB') {
      return 2;
    } else if (tema == 'TemaC') {
      return 3;
    } else {
      return 1;
    }
  }

  Color getCor1() {
    if (tema == 'TemaA') {
      return new Color(0xFF0A79DF);
    } else if (tema == 'TemaB') {
      return Color(0xFF6ab04c);
    } else if (tema == 'TemaC') {
      return new Color(0xFFF3B431);
    } else {
      return new Color(0xFF0A79DF);
    }
  }

  Color getCor2() {
    if (tema == 'TemaA') {
      return new  Color(0xFF74B9FF);
    } else if (tema == 'TemaB') {
      return new Color(0xFF75DA8B);
    } else if (tema == 'TemaC') {
      return new Color(0xFFFBD28B);
    } else {
      return new Color(0xFF74B9FF);
    }
  }

  String getImage() {
    if (tema == 'TemaA') {
      return 'imagens/Logo.png';
    } else if (tema == 'TemaB') {
      return 'imagens/Logo.png';
    } else if (tema == 'TemaC') {
      return 'imagens/Logo.png';
    } else {
      return 'imagens/Logo.png';
    }
  }
}
