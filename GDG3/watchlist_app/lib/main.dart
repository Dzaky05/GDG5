import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Watchlist App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,

      ),
      home: const MyHomePage(),
    );
  }
}

// ================= DATA FILM (JSON / LIST) =================
final List<Map<String, dynamic>> films = [
  {
    'title': 'The Conjuring',
    'genre': 'Horror',
    'rating': 5,
    'watched': true,
  },
  {
    'title': 'Interstellar',
    'genre': 'Sci-Fi',
    'rating': 5,
    'watched': false,
  },
  {
    'title': 'Avengers',
    'genre': 'Action',
    'rating': 5,
    'watched': true,
  },
  {
    'title': 'Titanic',
    'genre': 'Romance',
    'rating': 4,
    'watched': false,
  },
  {
    'title': 'The amazing Spiderman',
    'genre': 'Action',
    'rating': 5,
    'watched': true,
  },
  {
    'title': 'Batman',
    'genre': 'Action',
    'rating': 4,
    'watched': false,
  },
  {
    'title': 'Up',
    'genre': 'Animation',
    'rating': 5,
    'watched': true,
  },
  {
    'title': 'Coco',
    'genre': 'Animation',
    'rating': 5,
    'watched': false,
  },
];

// ================= HOME PAGE =================
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist App'),
        centerTitle: true,
      ),
      body: _selectedIndex == 0 ? gridPage() : listPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // STATE BERUBAH
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Grid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }

  // ================= GRID PAGE =================
  Widget gridPage() {
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: films.length,
      itemBuilder: (context, index) {
        final film = films[index];
        return Card(
          color: film['watched'] ? const Color.fromARGB(255, 82, 172, 245) : const Color.fromARGB(255, 247, 73, 73),
          child: InkWell(
            onTap: () {
              setState(() {
                film['watched'] = !film['watched'];
              });
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  film['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ================= LIST PAGE =================
  Widget listPage() {
    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        final film = films[index];
        return ListTile(
          tileColor: film['watched'] ? const Color.fromARGB(255, 80, 167, 237) : const Color.fromARGB(255, 246, 123, 123),
          title: Text(film['title']),
          subtitle: Text(
            '${film['genre']} -- Rating: ${film['rating']}',
          ),
          trailing: Icon(
            film['watched']
                ? Icons.check_circle
                : Icons.access_time,
            color: film['watched'] ? const Color.fromARGB(255, 18, 140, 240) : const Color.fromARGB(255, 239, 80, 69),
          ),
          onTap: () {
            setState(() {
              film['watched'] = !film['watched'];
            });
          },
        );
      },
    );
  }
}
