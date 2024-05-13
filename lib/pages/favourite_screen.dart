import 'package:flutter/material.dart';

class FavoriteQuotesScreen extends StatelessWidget {
  final List<String> favoriteQuotes;

  const FavoriteQuotesScreen({Key? key, required this.favoriteQuotes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Quotes'),
      ),
      body: favoriteQuotes.isEmpty
          ? Center(child: Text('You have no favorite quotes yet.'))
          : ListView.builder(
              itemCount: favoriteQuotes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.limeAccent
                  ),
                  child: ListTile(
                    title: Text(favoriteQuotes[index]),
                  ),
                );
              },
            ),
    );
  }
}
