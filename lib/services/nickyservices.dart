import 'package:cleanserv/graphql_config.dart';
import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:dio/dio.dart' as dio;


class Nicky extends GetxService {
  static Nicky get service => Get.find();
  Future<Nicky> init() async => this;
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  // Future<GraphQLClient> client = graphQLConfig.clientToQuery();

  ///
  /// Usuario autenticado
  ///
  final _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  // Future<QueryResult> login(String email, String password) async {
  //   QueryResult result = await client.mutate(
  //     MutationOptions(
  //       fetchPolicy: FetchPolicy.noCache,
  //       document: gql(gql_str.login),
  //       variables: {'email': email, 'password': password},
  //     ),
  //   );
  //   return result;
  // }

  ///
  /// Desloguear al usuario del sistema
  ///
  logout() {
    _isLoggedIn.value = false;
  }

  ///
  /// Cambiar la contraseña del usuario en el sistema
  ///
  forgotPassword(String email) async {}

  ///
  /// Registrar al usuario en el sistema
  ///
  register(String email, String username, String password, String phone,
      String rut) async {}

  // ...
}
