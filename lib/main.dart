// ignore_for_file: prefer_const_constructors, unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Screen/paginaMensagens.dart';
import 'package:teste/Screen/screen_cadastro_usuario.dart';
import 'package:teste/Screen/screen_login.dart';
import 'package:teste/Screen/telaInfoUsuario.dart';
import 'package:teste/Screen/company/telaInicial_empresa.dart';
import 'package:teste/Screen/telaSessao.dart';
import 'package:teste/widgets/login_widgets.dart';
import 'Screen/avisoEventoUsuario.dart';
import 'Screen/cadastroEventoUsuario.dart';
import 'Screen/user/paginaInicialUsuario.dart';
import 'Screen/screen_formulario_cadastro_evento.dart';
import 'Screen/screen_mensagem_programada.dart';
import 'core/message_data.dart';
import 'core/model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => MessageData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 168, 231, 100)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenLogin(),
        '/tela_de_boas_vindas': (context) => TelaInicialEmpresa(),
        'tela_inicial_usuario': (context) => MessageScreen(),
        'paginaInicialUsuario' : (context) => PaginaInicialUsuario(),
      },
    );
  }
}
