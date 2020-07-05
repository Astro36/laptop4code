import 'dart:math';
import 'package:flutter/material.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchAppBar(),
        ],
      ),
    );
  }
}

class SearchAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchAppBar();
}

class _SearchAppBar extends State<SearchAppBar> {
  List<String> searchHistory = ['hello', 'world'];
  bool isSearchFormActive = false;

  Widget _buildKeywordTile(String keyword, void Function(String) onRemoved) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Text(
            keyword,
            style: const TextStyle(color: colorBabyBlue),
          ),
          IconButton(
            iconSize: 16.0,
            icon: const Icon(Icons.close),
            color: colorBabyBlue,
            hoverColor: Colors.white,
            onPressed: () => onRemoved(keyword),
          )
        ],
      ),
    );
  }

  Widget _buildSearchForm() {
    var updateHistory = (keyword) {
      setState(() {
        searchHistory.remove(keyword);
      });
    };

    List<Widget> historyTiles = searchHistory
        .map((keyword) => _buildKeywordTile(keyword, updateHistory))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(children: historyTiles),
            ),
          ),
          if (isSearchFormActive)
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                autofocus: true,
                onSubmitted: (keyword) {
                  setState(() {
                    if (keyword.isNotEmpty) {
                      searchHistory.add(keyword);
                    }
                    isSearchFormActive = false;
                  });
                },
                style: TextStyle(color: Colors.white),
              ),
              width: min(MediaQuery.of(context).size.width / 2, 500),
            ),
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              setState(() {
                isSearchFormActive = true;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: colorClassicBlue,
          height: 200,
        ),
        Column(
          children: [
            const Padding(
              padding: const EdgeInsets.all(34.0),
              child: const Text(
                'Laptop4Code',
                style: const TextStyle(color: Colors.white, fontSize: 48.0),
              ),
            ),
            _buildSearchForm(),
          ],
        ),
      ],
    );
  }
}
