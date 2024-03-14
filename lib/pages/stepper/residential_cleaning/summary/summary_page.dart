import 'dart:ui';

import 'package:cleanserv/models/result.dart';
import 'package:cleanserv/pages/dashboard/dashboard_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/summary/summary_controller.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:cleanserv/widgets/summary_widgets/summary_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../widgets/bottom_navigation.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({
    super.key,
    required this.result,
  });
  final Result result;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  late final HttpLink httpLink;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
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
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: SummaryContent(result: widget.result),
              ),
            )),
            GetBuilder(
              init: SummaryController(),
              builder: (controller) => BottomNavigation(
                  disabledBackButton: true,
                  disabledNextButton: false,
                  loadingNextButton: controller.loadingButton,
                  nextFunction: () async {
                    await controller.reserveServiceMutation(widget.result.id);
                    Get.offNamed('/dashboard');
                    Get.to(() => const HistoryPage());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
