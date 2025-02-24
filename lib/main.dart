import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DiscoverTroncal(),
    );
  }
}

class DiscoverTroncal extends StatefulWidget {
  const DiscoverTroncal({super.key});

  @override
  _DiscoverTroncalState createState() => _DiscoverTroncalState();
}

class _DiscoverTroncalState extends State<DiscoverTroncal> {
  // Lista de lugares turísticos
  final List<Map<String, dynamic>> lugares = [
    {
      "title": "LAS 7 CASCADAS",
      "images": ["images/cascadas1.jpg", "images/cascadas2.jpg"],
      "description":
          "Las 7 cascadas es un lugar oculto entre la densa vegetación de La Troncal. Ubicado en el recinto Cochancay, cuenta con 7 hermosas cascadas en las cuales puede disfrutar de un agradable momento en familia.",
    },
    {
      "title": "EL MIRADOR DE COCHANCAY",
      "images": ["images/mirador1.jpg", "images/mirador2.jpg"],
      "description":
          "Mirador de Cochancay, un hermoso lugar ubicado en La Troncal, Recinto Cochancay, donde pueden ir de visita y disfrutar de una gran variedad de comidas y bebidas, observando la hermosa ciudad de La Troncal desde lo más alto.",
    },
    {
      "title": "EL BALNEARIO PEDREGAL",
      "images": ["images/pedre1.jpg", "images/pedre2.jpg"],
      "description":
          "Un balneario ubicado en La Troncal, vía La Puntilla, lugar que cuenta con más de 12 piscinas para personas de diferentes edades.",
    },
    {
      "title": "LA PLAYITA DE COCHANCAY",
      "images": ["images/playita1.jpg", "images/playita2.jpg"],
      "description":
          "La Playita de Cochancay, donde encontrarás un gran ambiente, comida y un gran río del cual puedes disfrutar.",
    },
    {
      "title": "AGUAS TERMALES DE YANAYACU",
      "images": ["images/yana1.jpg", "images/yana2.jpg"],
      "description":
          "Aguas termales de Yanayacu, ubicados en el recinto Cochancay.",
    },

        {
      "title": "AGUAS TERMALES DE YANAYACU",
      "images": ["images/yana1.jpg", "images/yana2.jpg"],
      "description":
          "Aguas termales de Yanayacu, ubicados en el recinto Cochancay.",
    },
  ];

  int lugaractual = 0; // Índice del lugar actual

  // Función para cambiar al siguiente lugar
  void siguientelugar() {
    setState(() {
      if (lugaractual < lugares.length - 1) {
        lugaractual++;
      } else {
        lugaractual = 0; // Volver al primer lugar si se llega al final
      }
    });
  }

  // Función para cambiar al lugar ANTERIOR
  void anteriorlugar() {
    setState(() {
      if (lugaractual > 0) {
        lugaractual--;
      } else {
        lugaractual = lugares.length - 1; // Volver al último lugar si se llega al inicio
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final nuevolugar = lugares[lugaractual];

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        elevation: 50,
        title: const Text(
          "DESCUBRE LA TRONCAL",
          style: TextStyle(
            fontFamily: "BebasNeue",
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${lugaractual + 1}. ${nuevolugar["title"]}", // Agregar el número al título
              style: const TextStyle(
                fontFamily: "BebasNeue",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10), // PARA DAR ESPACIO ENTRE OBJETOS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var image in nuevolugar["images"])
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 150,
                        height: 250,
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover, // Asegura que la imagen se ajuste al espacio sin deformarse
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                nuevolugar["description"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "BebasNeue",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: siguientelugar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                "Siguiente Lugar",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              // Visibility Envuelve el botón en un widget Visibility y haz que solo sea visible cuando lugaractual > 0
              visible: lugaractual > 0,
              child: ElevatedButton(
                onPressed: anteriorlugar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  "Anterior Lugar",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}