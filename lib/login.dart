import 'package:flutter/material.dart';
import 'package:flutter2/constantes.dart' as con;
import 'package:flutter2/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo, //FONDO
      body: Stack(
        children: [
          // Fondo con la imagen "imagenes/Welcome1.png"
          Positioned.fill(
            top: null,
            bottom: size.height *
                0.55, // La imagen abarca la mitad de la página hacia arriba
            child: Image.asset(
              'imagenes/Welcome1.png',
              fit: BoxFit.cover,
              alignment:
                  Alignment.center, // La imagen está centrada verticalmente
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.1,
              left: size.width * 0.1,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child:
                  Image.asset("imagenes/Welcome2.png", width: size.width * 0.3),
            ),
          ),
          // Contenedor blanco que envuelve el texto
          Positioned(
            left: size.width * 0.05, // Espaciado izquierdo
            right: size.width * 0.05, // Espaciado derecho
            bottom: size.height * 0.03, // Espaciado inferior
            child: Container(
              padding: EdgeInsets.all(20.0),
              height: size.height * 0.6,
              decoration: BoxDecoration(
                color: con.blanco,
                borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Bienvenido a\nBurger Classic",
                    style: TextStyle(
                      color: con.secundario,
                      fontSize: size.width * 0.06, // Tamaño de fuente adaptable
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.05), // Espaciado adaptable
                  // Campo de texto para el usuario
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Correo/Usuario",
                      labelStyle: TextStyle(color: con.gris),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: con.gris),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: con.secundario),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01), // Espaciado adaptable
                  // Campo de texto para la contraseña
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      labelStyle: TextStyle(color: con.gris),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: con.gris),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: con.secundario),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.13), // Espaciado adaptable
                  //BtnIniciar sesión
                  ElevatedButton(
                    onPressed: () {
                      //Cambio de vista pop(anterior), push(coloca una nueva vista sobre la pila de vista)
                      //Si ya no se quiere regresar a la anterior, se prefiere usar pushReplacement para usar menos memoria
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
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
                  SizedBox(height: size.height * 0.02), // Espaciado adaptable
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿Olvidaste la contraseña?',
                      style: TextStyle(color: con.secundario),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
