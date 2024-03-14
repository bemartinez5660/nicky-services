import 'package:get/get.dart';
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cleanserv/environment.dart';

import 'package:cleanserv/graphql_strings.dart' as gql_str;
import 'package:graphql_flutter/graphql_flutter.dart';

class TypePropertyController extends GetxController {
  late HttpLink httpLink;
  late AuthLink authLink;
  late Link link;

  List<dynamic> nodes = [];

  bool _loading = true;
  bool get loading => _loading;

  Future<List<dynamic>> typePropertyQuery() async {
    httpLink = HttpLink(Environment.endpoint);

    GraphQLClient _client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
    QueryResult result = await _client.query(
      QueryOptions(document: gql(gql_str.typeProperty)),
    );
    if (result.hasException) {
      throw Exception(result.exception!.graphqlErrors.first.message);
    }
    nodes = result.data?['serviceparameters']['nodes'] ?? [];

    _loading = false;
    update();
    return nodes;
  }
}
