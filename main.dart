import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.jpg', // Make sure to place your logo image in the assets folder.
              height: 40,
            ),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Push the footer to the bottom
        children: <Widget>[
          // Main content section
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    // About Section
                    const Text(
                      'About Us',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Baba Guru Nanak University (BGNU) Baba Guru Nanak University BGNU is a Public sector university located in District Nankana Sahib, in the Punjab region of Pakistan. It plans to facilitate between 10,000 to 15,000 students from all over the world at the university. The foundation stone of the university was laid on October 28, 2019 ahead of 550th of Guru Nanak Gurpurab by the Prime Minister of Pakistan. On July 02, 2020 Government of Punjab has formally passed Baba Guru Nanak University Nankana Sahib Act 2020 X of 2020. The plan behind the establishment of this university to be modeled along the lines of world renowned universities with focus on languages and Punjab Studies offering faculties in Medicine, Pharmacy, Engineering, Computer science, Languages, Music and Social sciences. The initial cost Rupees 6 billion has already been allocated in the budget for this project to be spent in three phases on construction of Baba Guru Nanak University Nankana Sahib. The development work of Phase-I has already been started by Communication and Works Department of Government of Punjab..',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
            
                    
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/pic.jpg', // Replace with your image in assets.
                      height: 150, // Adjusted image size without BoxFit
                      width: double.infinity,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Footer Section
          Container(
            width: double.infinity, // Ensure the footer spans the entire width
            color: Colors.deepPurple, // Footer background color
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  '© 2025 Your BGNU. All Rights Reserved.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Contact: info@yourcompany.com | Terms of Service | Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
