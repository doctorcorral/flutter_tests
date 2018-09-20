import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './queries/searchAutocomplete.dart' as squeries;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

  HttpLink link = HttpLink(
    uri: 'https://production.suggestic.com/graphql',
    headers: <String, String>{
      'Authorization': 'Bearer ', 
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
      ),
      body: Query(
  options: QueryOptions(
    document: squeries.autocomplete, // this is the query string you just created
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
    List repositories = result.data['outocomplete']['edges'];

    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        final repository = repositories[index];

        return Text(repository['node']['name']);
    });
  },
),
    );
  }
}
