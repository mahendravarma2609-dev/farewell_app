import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({
    super.key,
    required this.username,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final memoryController = TextEditingController();

  List<String> memories = [];

  void addMemory() {
    String text = memoryController.text.trim();

    if (text.isNotEmpty) {
      setState(() {
        memories.add(text);
        memoryController.clear();
      });
    }
  }

  void deleteMemory(int index) {
    setState(() {
      memories.removeAt(index);
    });
  }

  void logout() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${widget.username}"),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: memoryController,

              decoration: const InputDecoration(
                hintText: "Write your memory...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: addMemory,
                child: const Text("Save Memory"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: memories.isEmpty
                  ? const Center(
                      child: Text("No memories yet"),
                    )
                  : ListView.builder(
                      itemCount: memories.length,

                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(memories[index]),

                            trailing: IconButton(
                              icon: const Icon(Icons.delete),

                              onPressed: () {
                                deleteMemory(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
