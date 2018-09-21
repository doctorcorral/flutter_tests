import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './queries/searchAutocomplete.dart' as squeries;

import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpLink link = HttpLink(
      uri: 'https://production.suggestic.com/graphql',
      headers: <String, String>{
        'Authorization':
            'Bearer ',
      },
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Demito',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Pinshi autocomplete search says:'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _searchText = "salmon";
  String get searchText => _searchText;

  Widget appBarTitle = new Text(
    "Food search 🍔",
    style: new TextStyle(color: Colors.white),
  );

  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  bool _isSearching;
  List searchresult = new List();

  _MyHomePageState() {
    print('$searchText');

    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
          print('searchText: $searchText');
          _query = _getQuery(_searchText);
        });
      }
    });
  }

  Query _query;

  Query _getQuery(String querystring) {
    String _sq = squeries.autocomplete.replaceFirst("querystring", querystring);
    print(_sq);
    return Query(
      options: QueryOptions(
        document: _sq, // this is the query string you just created
        variables: {
          'querystring': querystring,
        },
        pollInterval: 10,
      ),
      builder: (QueryResult result) {
        if (result.errors != null) {
          return Text(result.errors.toString());
        }

        if (result.loading) {
          return Text('Loading...🕓');
        }

        // it can be either Map or List
        List foodItems = result.data['outocomplete']['edges'];

        return ListView.builder(
            padding: EdgeInsets.all(5.0),
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final foodItem = foodItems[index];
              return Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(foodItem['node']['name'],
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text("Carbs: ${foodItem['node']['nutrients']['chocdf']} %"),
                  ],
                ),
              );

              ;
            });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    _query = _getQuery(_searchText);
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(
        backgroundColor: Colors.brown[300],
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(
            icon: icon,
            onPressed: () {
              setState(() {
                if (this.icon.icon == Icons.search) {
                  this.icon = new Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = new TextField(
                    controller: _controller,
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)),
                    onChanged: searchOperation,
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
      _query = _getQuery(_searchText);
    });
  }

  void _handleSearchEnd() {
    setState(() {
      _query = _getQuery(_searchText);
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search for Food",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    _searchText = searchText;
    if (_isSearching != null) {
      _query = _getQuery(_searchText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(child: _query, minimum: EdgeInsets.all(15.0)),
      backgroundColor: Colors.white10,
    );
  }
}
