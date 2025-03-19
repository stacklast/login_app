import 'package:flutter/material.dart';
import '../services/db_helper.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await DBHelper().cerrarSesion();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "¡Bienvenido a la aplicación!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blueAccent),
                      title: Text("Perfil"),
                      subtitle: Text("Ver y editar tu perfil"),
                      onTap: () {
                        // Navegar a la página de perfil
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.blueAccent),
                      title: Text("Configuración"),
                      subtitle: Text("Ajustes de la aplicación"),
                      onTap: () {
                        // Navegar a la página de configuración
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.help, color: Colors.blueAccent),
                      title: Text("Ayuda"),
                      subtitle: Text("Obtener ayuda y soporte"),
                      onTap: () {
                        // Navegar a la página de ayuda
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}