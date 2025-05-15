import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'view_data_page.dart';
import 'home_screen.dart';  // Make sure this import matches the filename

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Text Saver',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: TextBoxButtonPage(),
    );
  }
}

class TextBoxButtonPage extends StatefulWidget {
  @override
  _TextBoxButtonPageState createState() => _TextBoxButtonPageState();
}

class _TextBoxButtonPageState extends State<TextBoxButtonPage> {
  final TextEditingController _controller = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  void _handleButtonPress() async {
    String enteredText = _controller.text.trim();
    if (enteredText.isEmpty) return;

    await _dbHelper.insertText(enteredText);
    _controller.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Saved to database: $enteredText')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input Page'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleButtonPress,
              child: Text('Save to DB'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewDataPage()),
                );
              },
              child: Text('View Saved Data'),
            ),
          ],
        ),
      ),
    );
  }
}
