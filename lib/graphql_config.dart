import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink =
      HttpLink('https://dev.api.nickyservices.com/graphql/');
  GraphQLClient clientToQuery() => GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: HiveStore(),
      ));
}
// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class GraphQLConfig {
//   static HttpLink httpLink =
//       HttpLink('https://dev.api.nickyservices.com/graphql/');

//   Future<GraphQLClient> clientToQuery() async {
//     await Hive.openBox<String>('graphqlCacheBox');

//     return GraphQLClient(
//       link: httpLink,
//       cache: GraphQLCache(store: HiveStore()),
//     );
//   }
// }
