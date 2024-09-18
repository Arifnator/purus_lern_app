import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hobbys',
      home: HobbyPage(),
    );
  }
}

class HobbyPage extends StatefulWidget {
  const HobbyPage({super.key});

  @override
  State<HobbyPage> createState() => _HobbyPageState();
}

class _HobbyPageState extends State<HobbyPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  Future<void> _addHobby() async {
    await FirebaseFirestore.instance.collection('Hobbies').add({
      'name': _nameController.text,
      'type': _typeController.text,
      'rating': _ratingController.text,
    });
    _nameController.clear();
    _typeController.clear();
    _ratingController.clear();
  }

  Stream<QuerySnapshot> _getHobbies() {
    return FirebaseFirestore.instance.collection('Hobbies').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hobby Bewertungen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Hobby Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _typeController,
              decoration: const InputDecoration(labelText: 'Hobby Art'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _ratingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Bewertung (0-5)'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              int? rating = int.tryParse(_ratingController.text);

              if (rating != null && rating >= 0 && rating <= 5) {
                _addHobby();
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content:
                            const Text("Bitte Zahl zwischen 0 und 5 eingeben."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    });
              }
            },
            child: const Text('Hobby hinzufügen'),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _getHobbies(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Fehler beim Abrufen der Daten'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final data = snapshot.requireData;

                return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    var hobby = data.docs[index];
                    return ListTile(
                      title: Text(hobby['name']),
                      subtitle: Text(
                          'Art: ${hobby['type']} - Bewertung: ${hobby['rating']}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
