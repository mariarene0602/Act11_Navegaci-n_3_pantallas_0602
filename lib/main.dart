import 'package:flutter/material.dart';

void main() {
  runApp(const MiAppNavegacion());
}

class MiAppNavegacion extends StatelessWidget {
  const MiAppNavegacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegación de Páginas', // Changed title from "Flutter Demo Rutas"
      // Definimos la ruta inicial
      initialRoute: '/',
      // Mapa de rutas: aquí asociamos un nombre a cada clase (Página)
      routes: {
        '/': (context) => const PrimeraPagina(),
        '/segunda': (context) => const SegundaPagina(),
        '/tercera': (context) => const TerceraPagina(),
      },
    );
  }
}

// --- PÁGINA 1: INICIO ---
class PrimeraPagina extends StatelessWidget {
  const PrimeraPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio María Hernández 6I", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Página Inicial",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/segunda'),
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Ir a la segunda página"),
            ),
          ],
        ),
      ),
    );
  }
}

// --- PÁGINA 2: IMAGEN ---
class SegundaPagina extends StatelessWidget {
  const SegundaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Página María Hernández 6I", style: TextStyle(color: Colors.white)), // Corrected text color for better contrast
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("¡Bienvenido a la segunda etapa!", style: TextStyle(fontSize: 18)),
            ),
            // Imagen desde la red
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://picsum.photos/400/300',
                height: 250,
                fit: BoxFit.cover, // Added fit property to image
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 50),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
              onPressed: () => Navigator.pushNamed(context, '/tercera'),
              child: const Text("Ir a la tercera página", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

// --- PÁGINA 3: CONTAINER ---
class TerceraPagina extends StatelessWidget {
  const TerceraPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tercera Página María Hernández 6I", 
          style: TextStyle(color: Colors.pinkAccent),
        ),
        backgroundColor: const Color(0xFF000080), // Azul Marino
        // --- AQUÍ CAMBIAMOS EL COLOR DE LA FLECHA ---
        iconTheme: const IconThemeData(color: Colors.white), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  "¡Container 200x200!", 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
              child: const Text("Volver al Inicio"),
            ),
          ],
        ),
      ),
    );
  }
}