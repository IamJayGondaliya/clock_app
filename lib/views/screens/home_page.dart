import 'package:clock_app/views/components/button_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://cdn.vectorstock.com/i/preview-1x/13/04/male-profile-picture-vector-2041304.jpg"),
              ),
              accountName: Text("Clock App"),
              accountEmail: Text("clockapp@demo.io"),
            ),
            buttonRow(
              btnName: "Demo",
              button: ElevatedButton(
                onPressed: () {},
                child: const Text("Demo button"),
              ),
            ),
            buttonRow(
              btnName: "Demo",
              button: ElevatedButton(
                onPressed: () {},
                child: const Text("Demo button"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buttonRow(
              btnName: "Text button",
              button: TextButton(
                onPressed: () {},
                child: const Text("Register"),
              ),
            ),
            buttonRow(
              btnName: "Text Icon button",
              button: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.app_registration),
                label: const Text("Register"),
              ),
            ),
            buttonRow(
              btnName: "Elevated button",
              button: ElevatedButton(
                onPressed: () {},
                child: const Text("Register"),
              ),
            ),
            buttonRow(
              btnName: "Elevated icon button",
              button: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.app_registration),
                label: const Text("Register"),
              ),
            ),
            buttonRow(
              btnName: "Elevated button",
              button: Theme(
                data: ThemeData(
                  useMaterial3: false,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ),
            ),
            buttonRow(
              btnName: "Outlined button",
              button: OutlinedButton(
                onPressed: () {},
                child: const Text("Outlined button"),
              ),
            ),
            buttonRow(
              btnName: "Game page",
              button: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('game_page');
                },
                child: const Text("Game Page"),
              ),
            ),
            buttonRow(
              btnName: "Clock page",
              button: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('clock_page');
                },
                child: const Text("Clock Page"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
