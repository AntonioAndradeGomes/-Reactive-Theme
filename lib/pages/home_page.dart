import 'package:flutter/material.dart';
import 'package:freela/costumizacao/costumizacao.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //em cada tela tem que ser feito isso
  Costumizacao costumizacao; //cria a variavel 
  @override
  void initState() {//função chamada sempre que o aplicativo iniciar
    super.initState();
    costumizacao = new Costumizacao();//instancia 
  }
  //--------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
            title: Text(
              'Tela Home',
              style: TextStyle(fontSize: 16),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.blue[700],
            //backgroundColor: colorAppBar,
          )),
      body: FutureBuilder<String>(//usar para pegar o valor do tema ao iniciar o app
          future: costumizacao.iniciarTema(),
          initialData: 'TemaA',//valor inicial do future, se demorar para pegar o valor do tema usa esse 
          builder: (context, snapshot) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.0, 0.65),
                        colors: [
                      costumizacao.getCor1(),
                      costumizacao.getCor2()
                    ])),
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    color: Colors.grey[100],
                    elevation: 5,
                    child: new Container(
                      child: new Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new RaisedButton(
                                onPressed: () {
                                  setState(() {//mudar o estado ao mudar as cores 
                                    costumizacao.setTema('TemaA');
                                  });
                                },
                                child: new Text('TemaA'),
                              ),
                              new SizedBox(
                                width: 10,
                              ),
                              new RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    costumizacao.setTema('TemaB');
                                  });
                                },
                                child: new Text('TemaB'),
                              ),
                              new SizedBox(
                                width: 10,
                              ),
                              new RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    costumizacao.setTema('TemaC');
                                  });
                                },
                                child: new Text('TemaC'),
                              ),
                            ],
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
