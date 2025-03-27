import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Core properties of MaterialApp
      title: 'Flutter Full Scaffold Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
        secondary: Colors.green, // Replacing accentColor with colorScheme.secondary
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,  // Disable the debug banner
      home: HomePage(),
      routes: {
        '/newPage': (context) => NewPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar properties
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.blueAccent,
        elevation: 10,  // Shadow depth
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      
      // Drawer properties
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('john.doe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('JD'),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      
      // Bottom Navigation Bar properties
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation when a bottom item is tapped
        },
      ),
      
      // FloatingActionButton properties
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newPage');
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.green,
        tooltip: 'Go to new page',
      ),

      // Body content
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newPage');
          },
          child: Text('Navigate to New Page'),
        ),
      ),
      
      // Bottom Sheet properties
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Persistent Button'),
        ),
      ],

      // SnackBar example
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          'Welcome to the New Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.red,
        tooltip: 'Back to Home Page',
      ),
    );
  }
}
