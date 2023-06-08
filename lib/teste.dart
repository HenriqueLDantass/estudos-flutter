import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/mocks/agendamento_mock.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> mockData = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];

  List<String> searchResults = [];

  void search(String query) {
    setState(() {
      searchResults = mockData
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void selectResult(String result) {
    setState(() {
      searchResults = [];
    });
    _searchController.text = result;
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: search,
          decoration: InputDecoration(
            hintText: 'Pesquisar',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(searchResults[index]),
            onTap: () => selectResult(searchResults[index]),
          );
        },
      ),
    );
  }
}
