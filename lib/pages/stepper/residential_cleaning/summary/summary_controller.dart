import 'package:get/get.dart';
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cleanserv/environment.dart';

import 'package:cleanserv/graphql_strings.dart' as gql_str;
import 'package:graphql_flutter/graphql_flutter.dart';

class SummaryController extends GetxController {
  late HttpLink httpLink;
  late AuthLink authLink;
  late Link link;

  List<dynamic> nodes = [];

  bool _loadingButton = false;
  bool get loadingButton => _loadingButton;

  Future<void> reserveServiceMutation(String id) async {
    httpLink = HttpLink(Environment.endpoint);

    GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
    _loadingButton = true;
    update();
    QueryResult result = await client.mutate(MutationOptions(
      document: gql(gql_str.serviceReservedMutation),
      variables: {"id": id},
    ));
    _loadingButton = false;
    update();
    if (result.hasException) {
      throw Exception(result.exception!.graphqlErrors.first.message);
    }
  }
}
