import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'game_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  final ApiService _apiService = ApiService();
  List<dynamic> _games = [];
  bool _isLoading = false;

  void _searchGames() async {
    setState(() {
      _isLoading = true;
    });

    _games = await _apiService.fetchGames(_searchController.text);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OYUN ARA')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'OYUN ARA',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchGames,
                ),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: _games.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_games[index]['name']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameDetailScreen(game: _games[index]),
                              ),
                            );
                          },
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
