import 'package:cleanserv/models/result.dart';
import 'package:flutter/material.dart';
import 'right_card.dart';
import '../../widgets/summary_widgets/services_cards.dart';
import '../../widgets/summary_widgets/slider_address.dart';
import '../../widgets/summary_widgets/subtotal_content.dart';

class SummaryContent extends StatefulWidget {
  const SummaryContent({super.key, required this.result});
  final Result result;

  @override
  State<SummaryContent> createState() => _SummaryContentState();
}

class _SummaryContentState extends State<SummaryContent> {
  List<Map<String, dynamic>> additionalServices = [];

  @override
  void initState() {
    super.initState();
    initServices();
  }

  initServices() {
    List<Node> nodes = widget.result.userserviceconfigSet.nodes;
    for (int i = 3; i < nodes.length; i++) {
      addService(nodes[i].parameter.parameter, i);
    }
  }

  addService(String name, int index) {
    switch (name) {
      case 'oven cleaning':
        additionalServices.add({
          'index': index,
          'name': 'Oven Cleaning',
          'image': 'assets/images/washing_machine.png'
        });
        break;
      case 'fridge cleaning':
        additionalServices.add({
          'index': index,
          'name': 'Fridge Cleaning',
          'image': 'assets/images/friedge.png'
        });
        break;
      case 'window cleaning':
        additionalServices.add({
          'index': index,
          'name': 'Window Cleaning',
          'image': 'assets/images/washing_window.png'
        });
        break;
      case 'laundry':
        additionalServices.add({
          'index': index,
          'name': 'Laundry',
          'image': 'assets/images/laundry.png'
        });
        break;
      case 'dishwashing':
        additionalServices.add({
          'index': index,
          'name': 'Dishwashing',
          'image': 'assets/images/dishwashing.png'
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                'Summary',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(21, 30, 50, 0.8)),
              ),
              const SizedBox(
                height: 12,
              ),
              SubtotalContent(result: widget.result),
              SliderAddress(result: widget.result),
              ServicesCards(result: widget.result),
              const SizedBox(
                height: 12,
              ),
              if (additionalServices.isNotEmpty)
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: additionalServices.length,
                    scrollDirection: Axis.horizontal,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RightCard(
                        imagePath: additionalServices[index]['image'],
                        title: additionalServices[index]['name'],
                        width: width * 0.2,
                        index: index,
                        tap: () {
                          setState(() {
                            // widget.result.userserviceconfigSet.nodes
                            //     .removeAt(additionalServices[index]['index']);
                            // additionalServices.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: width * 0.8,
                child: RichText(
                    text: const TextSpan(
                        text: 'Everything is ready,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                      TextSpan(
                          text:
                              ' upon arriving at the premises our workers will evaluate your needs and if necessary the estimated price will be modified',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal))
                    ])),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
