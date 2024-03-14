// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:cleanserv/environment.dart';
import 'package:cleanserv/graphql_strings.dart' as gql_str;

class AuthService extends GetxService {
  static AuthService get service => Get.find();
  Future<AuthService> init() async => this;
  late GraphQLClient _client;
  late String _token;

  Future<QueryResult> login(String email, String password) async {
    final MutationOptions options = MutationOptions(
      document: gql(gql_str.login),
      variables: {
        'email': email,
        'password': password,
      },
    );
    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception!.graphqlErrors.first.message);
    }

    _token = result.data!['login']['token'];
    return result;
  }

  String get token => _token;

  Future<void> logout() async {
    _token = '';
  }

  @override
  void onInit() {
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(Environment.endpoint),
    );

    super.onInit();
  }
}
