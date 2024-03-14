import 'dart:ui';

import 'package:cleanserv/environment.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:cleanserv/widgets/our_teams_widgets/team_card.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../widgets/bottom_navigation.dart';

final HttpLink httpLink = HttpLink(Environment.endpoint);

final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  ),
);

final query = gql('''
  query
{
  serviceteams
  (
    where: {AND: 
      [{isDeleted: {exact: false}}, 
      {isActive: {exact: true}}]},
  )
  {
    nodes{
      id
      abbreviation
      team
    }
  }
}
''');

class OurTeamsPage extends StatefulWidget {
  const OurTeamsPage({super.key});

  @override
  State<OurTeamsPage> createState() => _OurTeamsPageState();
}

class _OurTeamsPageState extends State<OurTeamsPage> {
  List<String> teams = ['Team 1', 'Team 2', 'Team 3'];
  List<String> names = [
    'Lianet',
    'johnatan',
    'Maria',
    'johnatan',
    'maria',
    'lianet',
    'juan',
    'pedro'
  ];
  List<int> rates = [5, 4, 3, 2];

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(
                      0.7), // Ajusta la opacidad según tus necesidades
                  BlendMode.srcATop,
                ),
                child: const ImageHeader(),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.white.withOpacity(0.75),
              ),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "Our teams",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(21, 30, 50, 0.8),
                        fontSize: 36,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.05,
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  Query(
                    options: QueryOptions(
                      document: query,
                    ),
                    builder: (result, {fetchMore, refetch}) {
                      if (result.hasException) {
                        // print(result.exception);
                        return const Center(
                          child: Text('Error loading availables teams.'),
                        );
                      }

                      if (result.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (result.data != null) {
                        List<dynamic> nodes =
                            result.data?['serviceteams']['nodes'] ?? [];
                        return SizedBox(
                          height: 300,
                          width: 300,
                          child: GridView.builder(
                            itemCount: nodes.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) => TeamCard(
                              teamName: nodes[index]['team'],
                              rate: rates[index],
                              name1: names[index],
                              name2: names[index + 1],
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text('Error loading availables teams.'),
                        );
                      }
                    },
                  ),
                ],
              ),
            )),
            BottomNavigation(
              disabledBackButton: false,
              disabledNextButton: false,
              loadingNextButton: false,
              nextFunction: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const AnythingElsePage(),
              // ));
            }),
          ],
        ),
      ),
    );
  }
}
