import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './queries/searchAutocomplete.dart' as squeries;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {



  HttpLink link = HttpLink(
    uri: 'https://api.github.com/graphql',
    headers: <String, String>{
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJkZGJlZWRhMi1kYWQwLTQxZjMtOWVhZi1hM2IzMzcxMTM3OGMiLCJpc3MiOiJzZzphcHAiLCJwaWQiOiI5NGY3ZjY3OS05OWUyLTQ4NTYtODU2Yy0yZDM2ZDY2YjcyOTYiLCJjYXQiOiIyMDE4MDgzMTE4MDMiLCJleHAiOjE1Mzg1MTg1NjAsImlhdCI6MTUzNzMwODk2MCwiYXVkIjoic2c6dXNlciJ9.t1qpEeAz0bav5XUAq6NlnLm2YWMZYzy3JsX1YZcnNb4',
      'Content-Type': 'application/json',
      'x-csrftoken': 'EHJnmV51WYlNeZ9J3l6nqLKXbhoYCgvQ',
      'Referer': 'https://production.suggestic.com/graphiql?operationName=null&query=%7B%0A%20%20outocomplete(query%3A%20%22Fish%2C%20salmon%2C%20atlantic%2C%20farmed%2C%20raw%22%2C%20mealType%3A%20USDA_MEAL)%20%7B%0A%20%20%20%20edges%20%7B%0A%20%20%20%20%20%20node%20%7B%0A%20%20%20%20%20%20%20%20name%0A%20%20%20%20%20%20%20%20mealType%0A%20%20%20%20%20%20%20%20databaseId%0A%20%20%20%20%20%20%20%20mealTypeDisplayName%0A%20%20%20%20%20%20%20%20servings%20%7B%0A%20%20%20%20%20%20%20%20%20%20amount%0A%20%20%20%20%20%20%20%20%20%20description%0A%20%20%20%20%20%20%20%20%20%20equivalent%0A%20%20%20%20%20%20%20%20%20%20unit%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20nutrients%20%7B%0A%20%20%20%20%20%20%20%20%20%20chocdf%0A%20%20%20%20%20%20%20%20%20%20fat%0A%20%20%20%20%20%20%20%20%20%20sugar%0A%20%20%20%20%20%20%20%20%20%20procnt%0A%20%20%20%20%20%20%20%20%20%20fibtg%0A%20%20%20%20%20%20%20%20%20%20netcarbs%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20extraInfo%0A%20%20%20%20%20%20%20%20nutrientsFull%20%7B%0A%20%20%20%20%20%20%20%20%20%20fiber%0A%20%20%20%20%20%20%20%20%20%20potassiumK%0A%20%20%20%20%20%20%20%20%20%20saturatedFat%0A%20%20%20%20%20%20%20%20%20%20transFats%0A%20%20%20%20%20%20%20%20%20%20cholesterol%0A%20%20%20%20%20%20%20%20%20%20sodiumNa%0A%20%20%20%20%20%20%20%20%20%20energy%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%7D%0A%20%20%20%20%7D%0A%20%20%7D%0A%7D%0A', 
      'Cookie': 'csrftoken=EHJnmV51WYlNeZ9J3l6nqLKXbhoYCgvQ; _ga=GA1.2.453230726.1529511744; sessionid=h0n3soyqap0dr0mvc65h8f97x8vzhs3z',
      
    },
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );

    //print(client.toString());


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
    List repositories = result.data['edges']['node'];

    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        final repository = repositories[index];

        return Text(repository['name']);
    });
  },
),
    );
  }
}
