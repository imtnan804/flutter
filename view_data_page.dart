import 'package:flutter/material.dart';
import 'database_helper.dart';

class ViewDataPage extends StatefulWidget {
  @override
  _ViewDataPageState createState() => _ViewDataPageState();
}

class _ViewDataPageState extends State<ViewDataPage> {
  List<String> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await DatabaseHelper().getAllTexts();
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saved Entries')),
      body: _data.isEmpty
          ? Center(child: Text('No data found'))
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.note),
                  title: Text(_data[index]),
                );
              },
            ),
    );
  }
}
