import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './queries/searchAutocomplete.dart' as squeries;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<Client> client = ValueNotifier(
      Client(
        endPoint: 'https://production.suggestic.com/graphql',
        cache: InMemoryCache(),
        apiToken: '.eyJ1aWQiOiJkZGJlZWRhMi1kYWQwLTQxZjMtOWVhZi1hM2IzMzcxMTM3OGMiLCJpc3MiOiJzZzphcHAiLCJwaWQiOiI5NGY3ZjY3OS05OWUyLTQ4NTYtODU2Yy0yZDM2ZDY2YjcyOTYiLCJjYXQiOiIyMDE4MDgzMTE4MDMiLCJleHAiOjE1Mzg1MTg1NjAsImlhdCI6MTUzNzMwODk2MCwiYXVkIjoic2c6dXNlciJ9.t1qpEeAz0bav5XUAq6NlnLm2YWMZYzy3JsX1YZcnNb4',
      ),
    );
    print(client.toString());

    return GraphqlProvider(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
      ),
      body: Query(
        squeries.autocomplete,
        variables: {
    'query': "salmon",
  },
        pollInterval: 1,
        builder: ({
          bool loading,
          Map data,
          Exception error,
        }) {
          if (error != null) {
            return Text(error.toString());
          }

          if (loading) {
            return Text('Loading ... 🕐');
          }

          // it can be either Map or List
          List searchResults = data['data']['outocomplete']['edges'];

          return ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final searchResult = searchResults[index];

                  return ListTile(
                    leading: Icon(Icons.star_border),
                    title: Text(searchResult['name']),
                    onTap: () {
                      print("me tapiaste");
                    },
                  );
   
            },
          );
        },
      ),
    );
  }
}
