import 'package:cleanserv/models/input.dart';
import 'package:get/get.dart';
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cleanserv/environment.dart';

import 'package:cleanserv/graphql_strings.dart' as gql_str;
import 'package:cleanserv/models/result.dart' as res;
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddressController extends GetxController {
  late HttpLink httpLink;
  late AuthLink authLink;
  late Link link;

  List<dynamic> nodes = [];

  bool _loading = true;
  bool get loading => _loading;

  bool _loadingButton = false;
  bool get loadingButton => _loadingButton;

  Future<List<dynamic>> getAddresses() async {
    httpLink = HttpLink(Environment.endpoint);

    GraphQLClient _client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
    QueryResult result = await _client.query(
      QueryOptions(document: gql(gql_str.getAddresses)),
    );
    if (result.hasException) {
      throw Exception(result.exception!.graphqlErrors.first.message);
    }
    nodes = result.data?['addresses']['nodes'] ?? [];

    _loading = false;
    update();
    return nodes;
  }

  Future<res.Result> createService(Input input) async {
    res.Result mutationResult;
    httpLink = HttpLink(Environment.endpoint);
    authLink = AuthLink(
      getToken: () async {
        final box = GetStorage();
        final authToken = await box.read('authToken');
        return 'JWT $authToken';
      },
      headerKey: 'Authorization',
    );
    link = authLink.concat(httpLink);
    GraphQLClient _client = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
    _loadingButton = true;
    update();
    QueryResult result = await _client.mutate(MutationOptions(
      document: gql(gql_str.serviceCreateMutation),
      variables: {"input": input},
    ));
    if (result.hasException) {
      throw Exception(result.exception!.graphqlErrors.first.message);
    }
    mutationResult =
        res.Result.fromJson(result.data!['serviceCreate']['result']);

    _loadingButton = false;
    update();
    return mutationResult;
  }
}
