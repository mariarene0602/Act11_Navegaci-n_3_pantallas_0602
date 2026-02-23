import 'package:flutter/material.dart';

// --- PÁGINA 2: IMAGEN ---
class SegundaPagina extends StatelessWidget {
  const SegundaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Página", style: TextStyle(color: Colors.white)), // Corrected text color for better contrast
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