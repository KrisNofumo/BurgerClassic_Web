import 'package:flutter/material.dart';
import 'package:flutter2/constantes.dart' as con;
import 'package:flutter2/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variables
  List titleProducts = [];
  List products = []; //Lista de datos de la BD para 1 solo recuadro

  @override
  void initState() {
    titleProducts.add('Todos');
    titleProducts.add('Combos');
    titleProducts.add('Clasicos');
    titleProducts.add('Adicionales');

    products.add('id#nombre#imagen#calif#favoritos#categoria');
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: con.fondo, //FONDO
        appBar: AppBar(
          backgroundColor: con.fondo,
          //title: Text('BURGER', selectionColor: Colors.white),
          //elevation: 10,
          //shadowColor: Colors.white,
          title: Center(
            child:
                Image.asset("imagenes/Welcome2.png", width: size.width * 0.1),
          ),
          iconTheme: IconThemeData(color: con.blanco),
          actions: [
            //LAS ACCIONES EXTRAS QUE PUEDE REALIZAR UNA APP Y SIEMPRE SE COLOCA A LA DERECHA
            IconButton(onPressed: () {}, icon: Icon(Icons.local_grocery_store)),
          ],
        ),

        //endDrawer: Drawer(), //parte derecha
        drawer:
            drawerWidget(), //EN CASO DE QUE NO LO DIBUJE (EL ICONO), parte izquierda
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Que hay de cenar',
                        style: TextStyle(
                          color: con.amarillo,
                          fontSize: 28,
                          letterSpacing: 1.5,
                        ))
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const ScrollPhysics(),
                      itemCount: titleProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          titleProducts[index],
                          style: TextStyle(color: con.blanco, fontSize: 18),
                        );
                      }),
                ),
                boxWidget(size: size)
              ],
            )
          ],
        ));
  }
}

class boxWidget extends StatelessWidget {
  const boxWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: con.secundario,
          borderRadius: BorderRadius.circular(20),
        ),
        /*
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: con.blanco,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "imagenes/Welcome2.png",
                          width: size.width * 0.15,
                        ),
                        Text(
                          'Hamburguesa',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'Nuevo estilo',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                              size: 14,
                            ),
                            Icon(
                              Icons.heart_broken_outlined,
                              size: 14,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: con.blanco,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "imagenes/Welcome2.png",
                          width: size.width * 0.15,
                        ),
                        Text(
                          'Hamburguesa',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'Nuevo estilo',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                              size: 14,
                            ),
                            Icon(
                              Icons.heart_broken_outlined,
                              size: 14,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );*/
        child: SizedBox(
            height: size.height * 0.65,
            width: size.width,
            //  ! Se usa listview para listas con widgets creados on demand
            // ! ITERA LA LISTA, ES COMO UN FOR
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 5, //Agrega 6 rows
              // * El item builder solo permite retornar 1 elemento
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: Row(
                      // ! Fila de contenedores blancos
                      children: [
                        // Aquí
                        // * Contenedor blanco
                        Expanded(
                            flex: 6, //50%
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: con.blanco,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                // ! ocupar el espacio mínimo de los widgets hijos
                                children: [
                                  Image.asset(
                                    "imagenes/Welcome2.png",
                                    width: size.width * 0.15,
                                  ),

                                  // * Hamburguesa y nuevo estilo
                                  const Text(
                                    "Hamburguesa",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const Text(
                                    "Nuevo estilo",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),

                                  // * Iconos
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellowAccent, size: 14),
                                      Icon(
                                        Icons.heart_broken_outlined,
                                        size: 14,
                                      )
                                    ], // *
                                  )
                                ],
                              ),
                            )),

                        //Espaciado entre ambos contenedores
                        SizedBox(
                          width: size.width * 0.05,
                        ),

                        // * Contenedor blanco
                        // Si
                        Expanded(
                            flex: 6, //50%
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: con.blanco,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                // ! ocupar el espacio mínimo de los widgets hijos
                                children: [
                                  Image.asset(
                                    "imagenes/Welcome2.png",
                                    width: size.width * 0.15,
                                  ),

                                  // * Hamburguesa y nuevo estilo
                                  const Text(
                                    "Hamburguesa",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const Text(
                                    "Nuevo estilo",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),

                                  // * Iconos
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellowAccent, size: 14),
                                      Icon(
                                        Icons.heart_broken_outlined,
                                        size: 14,
                                      )
                                    ], // *
                                  )
                                ],
                              ),
                            )),
                      ],
                    ));
              },
            )));
  }
}
