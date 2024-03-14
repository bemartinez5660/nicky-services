import 'dart:collection';
import 'dart:ui';
import 'package:cleanserv/models/input.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../common/utils.dart';

import 'package:cleanserv/pages/stepper/residential_cleaning/address/address_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:cleanserv/graphql_strings.dart' as gql_str;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/schedule_widgets/bottom_navigation_schedule.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cleanserv/environment.dart';

// late Future<List<dynamic>> daysFuture;

HttpLink httpLink = HttpLink(Environment.endpoint);

ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  ),
);

String time = "";
String additionalNote = "";

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key, required this.input});
  final Input input;

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  final Set<DateTime> _disabledDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  bool endLoading = false;

  late PageController _pageController;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    // daysFuture = daysQuery();
    _selectedDays.add(_focusedDay.value);
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  bool get canClearSelection =>
      _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDays.clear();
      _selectedDays.add(selectedDay);
      _focusedDay.value = focusedDay;
    });
  }

  // Future<List<dynamic>> daysQuery() async {
  //   QueryResult queryResult;
  //   List<dynamic> nodes = [];
  //   try {
  //     queryResult = await client.query(QueryOptions(
  //       document: query,
  //       variables: {
  //         'year': kToday.year,
  //         'month': kToday.month,
  //       },
  //     ));
  //     if (queryResult.hasException) {
  //       throw Exception(queryResult.exception);
  //     }
  //     nodes = queryResult.data?['getDisabledMontDays'] ?? [];
  //     for (String day in nodes) {
  //       List<String> dateParts = day.split('-');
  //       DateTime parsedDate = DateTime(int.parse(dateParts[0]),
  //           int.parse(dateParts[1]), int.parse(dateParts[2]));
  //       _disabledDays.add(parsedDate);
  //     }
  //     DateTime auxDate = _focusedDay.value;
  //     bool stop = true;
  //     while (stop) {
  //       if (_disabledDays.contains(auxDate)) {
  //         auxDate = DateTime(auxDate.year, auxDate.month, auxDate.day + 1);
  //       } else {
  //         _focusedDay.value = auxDate;
  //         endLoading = true;
  //         stop = false;
  //       }
  //     }
  //   } catch (e) {
  //     return nodes;
  //   }
  //   return nodes;
  // }

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
                  Colors.white.withOpacity(0.7),
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
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                        child: Text(
                      "Schedule an appointment with us",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.05,
                          color: Color.fromRGBO(21, 30, 50, 0.8)),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    // Header
                    ValueListenableBuilder<DateTime>(
                      valueListenable: _focusedDay,
                      builder: (context, value, _) {
                        return _CalendarHeader(
                          focusedDay: value,
                          clearButtonVisible: canClearSelection,
                          onTodayButtonTap: () {
                            setState(() => _focusedDay.value = DateTime.now());
                          },
                          onClearButtonTap: () {
                            setState(() {
                              _rangeStart = null;
                              _rangeEnd = null;
                              _selectedDays.clear();
                            });
                          },
                          onLeftArrowTap: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                          onRightArrowTap: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                        );
                      },
                    ),

                    Query(
                      options: QueryOptions(
                        document: gql(gql_str.getDisabledMonthDays),
                        variables: {
                          'year': _focusedDay.value.year,
                          'month': _focusedDay.value.month,
                        },
                      ),
                      builder: (result, {fetchMore, refetch}) {
                        if (result.hasException) {
                          // print(result.exception);
                          return const Center(
                            child: Text('Error loading availables dates.'),
                          );
                        }

                        if (result.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (result.data != null) {
                          List<dynamic> nodes =
                              result.data?['getDisabledMontDays'] ?? [];
                          for (String day in nodes) {
                            List<String> dateParts = day.split('-');
                            DateTime parsedDate = DateTime(
                                int.parse(dateParts[0]),
                                int.parse(dateParts[1]),
                                int.parse(dateParts[2]));
                            _disabledDays.add(parsedDate);
                          }
                          if (!endLoading) {
                            endLoading = true;
                          }

                          // TABLE CALENDAR
                          return TableCalendar(
                            firstDay: kFirstDay,
                            lastDay: kLastDay,
                            focusedDay: _focusedDay.value,
                            headerVisible: false,
                            selectedDayPredicate: (day) =>
                                _selectedDays.contains(day),
                            calendarFormat: _calendarFormat,
                            onDaySelected: _onDaySelected,
                            availableGestures:
                                AvailableGestures.horizontalSwipe,
                            enabledDayPredicate: (day) =>
                                !_disabledDays.contains(day),
                            onCalendarCreated: (controller) =>
                                _pageController = controller,
                            onPageChanged: (focusedDay) {
                              setState(() {
                                _focusedDay.value = focusedDay;
                              });
                            },
                            calendarBuilders: CalendarBuilders(
                              rangeHighlightBuilder:
                                  (context, day, isWithinRange) {
                                if (isWithinRange) {
                                  if (day == _rangeStart) {
                                    if (kToday.month != day.month) {
                                      return Center(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                height: 33,
                                                color: HexColor("#E74F47")
                                                    .withOpacity(0.25),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (kToday.month == day.month) {
                                      return Center(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                height: 33,
                                                color: HexColor("#E74F47"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  } else if (day == _rangeEnd) {
                                    if (kToday.month != day.month) {
                                      return Center(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                height: 33,
                                                color: HexColor("#E74F47")
                                                    .withOpacity(0.25),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (kToday.month == day.month) {
                                      return Center(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                height: 33,
                                                color: HexColor("#E74F47"),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  } else {
                                    if (kToday.month != day.month) {
                                      return Center(
                                        child: Container(
                                          height: 33,
                                          decoration: BoxDecoration(
                                              color: HexColor("#E74F47")
                                                  .withOpacity(0.25)),
                                        ),
                                      );
                                    } else if (kToday.month == day.month) {
                                      return Center(
                                        child: Container(
                                          height: 33,
                                          decoration: BoxDecoration(
                                              color: HexColor("#E74F47")),
                                        ),
                                      );
                                    }
                                  }
                                }
                                return null;
                              },
                              //------------------------START DISABLED BUILDER------------------------------
                              disabledBuilder: (context, day, focusedDay)
                                  //                             {
                                  //                               if (_focusedDay.value.month == day.month) {
                                  //                                 if (_disabledDays.contains(DateTime(day.year, day.month, day.day + 1)) &&
                                  //                                         _disabledDays.contains(DateTime(
                                  //                                             day.year,
                                  //                                             day.month,
                                  //                                             day.day - 1)) ||
                                  //                                     (day.isBefore(kToday) &&
                                  //                                         DateTime(day.year, day.month, day.day) !=
                                  //                                             DateTime(kToday.year, kToday.month,
                                  //                                                 kToday.day - 1))) {
                                  //                                   return DisabledCustomMarker(
                                  //                                       day: "${day.day}",
                                  //                                       color: HexColor("#E74F47"),
                                  //                                       rangePosition: 'onRange');
                                  //                                 } else if (_disabledDays.contains(DateTime(day.year, day.month, day.day + 1)) &&
                                  //                                     !_disabledDays.contains(DateTime(
                                  //                                         day.year, day.month, day.day - 1))) {
                                  //                                   return DisabledCustomMarker(
                                  //                                       day: "${day.day}",
                                  //                                       color: HexColor("#E74F47"),
                                  //                                       rangePosition: 'start');
                                  //                                 } else if (!_disabledDays.contains(DateTime(day.year, day.month, day.day + 1)) &&
                                  //                                         _disabledDays.contains(DateTime(
                                  //                                             day.year,
                                  //                                             day.month,
                                  //                                             day.day - 1)) ||
                                  //                                     (day.isBefore(kToday) &&
                                  //                                         DateTime(day.year, day.month, day.day) ==
                                  //                                             DateTime(
                                  //                                                 kToday.year, kToday.month, kToday.day - 1))) {
                                  //                                   return DisabledCustomMarker(
                                  //                                       day: "${day.day}",
                                  //                                       color: HexColor("#E74F47"),
                                  //                                       rangePosition: 'end');
                                  //                                 } else {
                                  //                                   return CustomMarker(
                                  //                                       day: "${day.day}",
                                  //                                       color: HexColor("#E74F47"));
                                  //                                 }
                                  //                               } else if (_focusedDay.value.month != day.month) {
                                  // //--------END OF IF CONDITION (_focusedDay.value.month != day.month) TO ANOTHER MONTH MARKERS------------
                                  //                                 if (_disabledDays.contains(DateTime(day.year, day.month, day.day + 1)) &&
                                  //                                         _disabledDays.contains(DateTime(
                                  //                                             day.year,
                                  //                                             day.month,
                                  //                                             day.day - 1)) ||
                                  //                                     (day.isBefore(kToday) &&
                                  //                                         DateTime(day.year, day.month, day.day) !=
                                  //                                             DateTime(kToday.year, kToday.month,
                                  //                                                 kToday.day - 1))) {
                                  //                                   return DisabledCustomMarker(
                                  //                                       day: "${day.day}",
                                  //                                       color:
                                  //                                           HexColor("#E74F47").withOpacity(0.25),
                                  //                                       rangePosition: 'onRange');
                                  //                                 } else if (_disabledDays.contains(DateTime(day.year, day.month, day.day + 1)) &&
                                  //                                     !_disabledDays.contains(DateTime(
                                  //                                         day.year, day.month, day.day - 1))) {
                                  //                                   return DisabledCustomMarker(
                                  //                                       day: "${day.day}",
                                  //                                       color:
                                  //                                           HexColor("#E74F47").withOpacity(0.25),
                                  //                                       rangePosition: 'start');
                                  //                                 } else if (!_disabledDays.contains(DateTime(day.year, day.month, day.day + 1)) &&
                                  //                                         _disabledDays.contains(DateTime(
                                  //                                             day.year,
                                  //                                             day.month,
                                  //                                             day.day - 1)) ||
                                  //                                     (day.isBefore(kToday) &&
                                  //                                         DateTime(day.year, day.month, day.day) ==
                                  //                                             DateTime(
                                  //                                                 kToday.year, kToday.month, kToday.day - 1))) {
                                  //                                   return DisabledCustomMarker(
                                  //                                       day: "${day.day}",
                                  //                                       color:
                                  //                                           HexColor("#E74F47").withOpacity(0.25),
                                  //                                       rangePosition: 'end');
                                  //                                 } else {
                                  //                                   return CustomMarker(
                                  //                                       day: "${day.day}",
                                  //                                       color: HexColor("#E74F47")
                                  //                                           .withOpacity(0.25));
                                  //                                 }
                                  //                               } else if (_focusedDay.value.month !=
                                  //                                   day.month) {}
                                  //                               return null;
                                  //                             },
                                  //--------------------------------END OF DISABLED BUILDER-----------------------------------------
                                  =>
                                  Center(
                                child: Text(
                                  DateFormat.d().format(day),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                      color: Color.fromRGBO(0, 0, 0, 0.25)),
                                ),
                              ),
                              withinRangeBuilder: (context, day, focusedDay) {
                                if (kToday.month != day.month) {
                                  return CustomMarker(
                                      day: "${day.day}",
                                      color:
                                          HexColor("#E74F47").withOpacity(0));
                                } else if (kToday.month == day.month) {
                                  return CustomMarker(
                                      day: "${day.day}",
                                      color: HexColor("#E74F47"));
                                }
                                return null;
                              },
                              rangeStartBuilder: (context, day, focusedDay) {
                                if (kToday.month != day.month) {
                                  if (day == _rangeStart && _rangeEnd != null) {
                                    return RangeStartMarker(
                                        day: "${day.day}",
                                        color: HexColor("#E74F47")
                                            .withOpacity(0.25));
                                  } else {
                                    return CustomMarker(
                                        day: "${day.day}",
                                        color: HexColor("#E74F47")
                                            .withOpacity(0.25));
                                  }
                                } else if (kToday.month == day.month) {
                                  return CustomMarker(
                                      day: "${day.day}",
                                      color: HexColor("#E74F47"));
                                }
                                return null;
                              },
                              rangeEndBuilder: (context, day, focusedDay) {
                                if (kToday.month != day.month) {
                                  if (day == _rangeEnd) {
                                    return RangeEndMarker(
                                        day: "${day.day}",
                                        color: HexColor("#E74F47")
                                            .withOpacity(0.25));
                                  } else {
                                    return CustomMarker(
                                        day: "${day.day}",
                                        color: HexColor("#E74F47")
                                            .withOpacity(0.25));
                                  }
                                } else if (kToday.month == day.month) {
                                  return CustomMarker(
                                      day: "${day.day}",
                                      color: HexColor("#E74F47"));
                                }
                                return null;
                              },
                              selectedBuilder: (context, day, events) {
                                return CustomMarker(
                                    day: "${day.day}",
                                    color: HexColor("#5926A6"));
                              },
                              defaultBuilder: (context, day, focusedDay) =>
                                  Center(
                                child: Text(
                                  DateFormat.d().format(day),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                                ),
                              ),
                              outsideBuilder: (context, day, focusedDay) {
                                return Center(
                                  child: Text(
                                    DateFormat.d().format(day),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Roboto',
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  ),
                                );
                              },

                              todayBuilder: (context, day, focusedDay) =>
                                  Center(
                                child: Text(
                                  DateFormat.d().format(day),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                                ),
                              ),
                              dowBuilder: (context, day) => Center(
                                  child: Text(
                                DateFormat.E().format(day).toUpperCase(),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                    color: HexColor("#1C1C1C")),
                              )),
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text('Error loading availables dates.'),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (endLoading)
              BottomNavigationSchedule(
                  focusedDate: _selectedDays.first,
                  nextFunction: () {
                    DateTime date = DateTime(
                        _selectedDays.first.year,
                        _selectedDays.first.month,
                        _selectedDays.first.day,
                        int.parse(time.substring(0, 2)),
                        int.parse(time.substring(3, 5)));
                    DateTime fecha = DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
                        .parse(date.toString(), true)
                        .toUtc();

                    widget.input.date =
                        DateFormat('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'')
                            .format(fecha.toUtc());
                    widget.input.additional = additionalNote;
                    Get.to(() => AddressPage(
                          input: widget.input,
                        ));
                  }),
          ],
        ),
      ),
    );
  }
}

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
    required this.day,
    required this.color,
  });
  final String day;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 33,
        width: 33,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24))),
        child: Center(
          child: Text(
            day,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class DisabledCustomMarker extends StatelessWidget {
  const DisabledCustomMarker({
    super.key,
    required this.day,
    required this.color,
    required this.rangePosition,
  });
  final String day;
  final Color color;
  final String rangePosition;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 33,
        decoration: BoxDecoration(
            color: color,
            borderRadius: rangePosition != 'onRange'
                ? BorderRadius.only(
                    topRight: rangePosition == 'end'
                        ? const Radius.circular(24)
                        : Radius.zero,
                    bottomLeft: rangePosition == 'start'
                        ? const Radius.circular(24)
                        : Radius.zero,
                    bottomRight: rangePosition == 'end'
                        ? const Radius.circular(24)
                        : Radius.zero,
                  )
                : null),
        child: Center(
          child: Text(
            day,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RangeStartMarker extends StatelessWidget {
  const RangeStartMarker({
    super.key,
    required this.day,
    required this.color,
  });
  final String day;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 33,
            width: 33,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 33,
                    decoration: BoxDecoration(
                        color: HexColor("#E74F47").withOpacity(0.25),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                        )),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              day,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class RangeEndMarker extends StatelessWidget {
  const RangeEndMarker({
    super.key,
    required this.day,
    required this.color,
  });
  final String day;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 33,
            width: 33,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 33,
                    decoration: BoxDecoration(
                        color: HexColor("#E74F47").withOpacity(0.25),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              day,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final month = DateFormat.MMMM().format(focusedDay);
    final year = DateFormat.y().format(focusedDay);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: onLeftArrowTap,
              ),
              Text(
                year,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(28, 28, 28, 0.5)),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: onRightArrowTap,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 16.0),
              SizedBox(
                child: Text(
                  month,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      color: Color.fromRGBO(28, 28, 28, 1)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
