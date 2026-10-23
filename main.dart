import 'package:flutter/material.dart';

void main() {
  runApp(const BunkerApp());
}

class BunkerApp extends StatelessWidget {
  const BunkerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BÚNKER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        primaryColor: Colors.redAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF141414),
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF141414),
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ChatScreen(),
    const ReelsScreen(),
    const MurosScreen(),
    const HotMatchScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_outline),
            activeIcon: Icon(Icons.lock),
            label: 'Chats P2P',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            activeIcon: Icon(Icons.movie),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Muros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department_outlined),
            activeIcon: Icon(Icons.local_fire_department),
            label: 'Hot Match',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 1. CHATS P2P ENCRIPTADOS
// -----------------------------------------------------------------------------
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BÚNKER P2P CHAT', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        actions: [
          IconButton(
            icon: const Icon(Icons.security, color: Colors.greenAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.redAccent.withOpacity(0.1),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shield, size: 16, color: Colors.redAccent),
                SizedBox(width: 8),
                Text('Conexión P2P directa - Sin servidores centralizados', style: TextStyle(fontSize: 12, color: Colors.redAccent)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text('Usuario P2P #${index + 102}'),
                  subtitle: const Text('Mensaje cifrado con clave P2P activa...'),
                  trailing: const Icon(Icons.lock, size: 14, color: Colors.greenAccent),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 2. REELS VERTICALES
// -----------------------------------------------------------------------------
class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.black,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.play_circle_fill, size: 80, color: Colors.white24),
                      const SizedBox(height: 10),
                      Text('Reel Búnker #${index + 1}', style: const TextStyle(color: Colors.white54)),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 100,
                  child: Column(
                    children: [
                      IconButton(icon: const Icon(Icons.favorite, color: Colors.redAccent, size: 30), onPressed: () {}),
                      const Text('1.2k', style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 16),
                      IconButton(icon: const Icon(Icons.comment, color: Colors.white, size: 30), onPressed: () {}),
                      const Text('84', style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 16),
                      IconButton(icon: const Icon(Icons.share, color: Colors.white, size: 30), onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 3. MUROS
// -----------------------------------------------------------------------------
class MurosScreen extends StatelessWidget {
  const MurosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MUROS BÚNKER')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(radius: 16, backgroundColor: Colors.redAccent),
                      const SizedBox(width: 10),
                      Text('Agente #${index + 5}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Publicación cifrada en Muro Búnker #${index + 1}. Información protegida sin registro de metadatos.'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(onPressed: () {}, icon: const Icon(Icons.thumb_up_alt_outlined, size: 16), label: const Text('Me gusta')),
                      TextButton.icon(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline, size: 16), label: const Text('Comentar')),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 4. HOT MATCH ZONE & MONETIZACIÓN
// -----------------------------------------------------------------------------
class HotMatchScreen extends StatelessWidget {
  const HotMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOT MATCH ZONE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            onPressed: () => _showSubscriptionDialog(context),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.local_fire_department, size: 70, color: Colors.redAccent),
                  const SizedBox(height: 16),
                  const Text('Coincidencia P2P Anónima', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Conecta de forma totalmente segura y privada.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    onPressed: () => _showSubscriptionDialog(context),
                    child: const Text('Buscar Coincidencia (Suscripción VIP)'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSubscriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Row(
          children: [
            Icon(Icons.workspace_premium, color: Colors.amber),
            SizedBox(width: 8),
            Text('Niveles de Suscripción'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTierTile('Pase Básico', '\$50 / mes', 'Acceso P2P Estándar'),
            _buildTierTile('Pase Búnker Pro', '\$500 / mes', 'Prioridad Hot Match + Reels HD'),
            _buildTierTile('Nivel Elite VIP', 'Hasta \$3,000 / mes', 'Acceso ilimitado + Modo Offline P2P'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar', style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget _buildTierTile(String title, String price, String desc) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(desc, style: const TextStyle(fontSize: 12)),
      trailing: Text(price, style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
    );
  }
}

// -----------------------------------------------------------------------------
// 5. PERFIL & CONFIGURACIÓN DE PRIVACIDAD / ZONA DE LIMPIEZA
// -----------------------------------------------------------------------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MI PERFIL')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text('Usuario Búnker #001', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined, color: Colors.redAccent),
              title: const Text('Configuración de privacidad'),
              subtitle: const Text('Ajustes invisibles y control de datos'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrivacySettingsScreen()),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _privateProfile = true;
  bool _hideFollowers = true;
  bool _hideLikes = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración de Privacidad')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Ajustes de Visibilidad', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          SwitchListTile(
            title: const Text('Perfil Privado'),
            value: _privateProfile,
            onChanged: (val) => setState(() => _privateProfile = val),
          ),
          SwitchListTile(
            title: const Text('Ocultar Seguidores'),
            value: _hideFollowers,
            onChanged: (val) => setState(() => _hideFollowers = val),
          ),
          SwitchListTile(
            title: const Text('Ocultar Me Gusta'),
            value: _hideLikes,
            onChanged: (val) => setState(() => _hideLikes = val),
          ),
          const SizedBox(height: 24),
          const Text('Zona de Limpieza', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Historial de Chats limpiado localmente.')));
            },
            child: const Text('Restablecer Chats (Azul)'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Contenido multimedia eliminado.')));
            },
            child: const Text('Restablecer Contenido (Naranja)'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('BÚNKER restablecido a estado de fábrica.')));
            },
            child: const Text('Restablecer Fábrica (Rojo)'),
          ),
        ],
      ),
    );
  }
}
