import 'package:flutter/material.dart';
import 'package:flutter2/constantes.dart' as con;
import 'package:flutter2/login.dart';
import 'package:flutter2/register.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //Contenedor para imagen de fondo
          Container(
            // Decoration para abarcar el fondo
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("imagenes/Welcome1.png"),
              fit: BoxFit.fill,
            )),
          ),

          //LOGO
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.1,
              left: size.width * 0.1,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child:
                  Image.asset("imagenes/Welcome2.png", width: size.width * 0.3),
              //TODO: Image)image: AssetImage("imagenes/Welcome 2.png"), --> TAMBIEN SIRVE)
            ),
          ),

          //BtnIniciar sesión
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.125),
            child:
                //ALineación al centro
                Align(
              alignment: Alignment.bottomCenter,
              //Botón de login
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
                style: ElevatedButton.styleFrom(
                    primary: con.primario,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: con.blanco, fontSize: 20),
                ),
              ),
            ),
          ),

          //Registrate
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.045),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                //Centrado del row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿No tienes cuenta?'),
                  //Suple la función de un InkWell
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(color: con.primario),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
