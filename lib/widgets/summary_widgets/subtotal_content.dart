import 'package:flutter/material.dart';
import 'package:cleanserv/models/result.dart';

class SubtotalContent extends StatefulWidget {
  const SubtotalContent({super.key, required this.result});
  final Result result;

  @override
  State<SubtotalContent> createState() => _SubtotalContentState();
}

class _SubtotalContentState extends State<SubtotalContent> {
  double subtotal = 0;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w400);
    String serviceName = widget.result.servicetype.servicetype;
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                serviceName,
                style: textStyle,
              ),
              Text(
                '\$${(widget.result.price).toStringAsFixed(2)}',
                style: textStyle,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recurrent Bonus (0%)',
                style: textStyle,
              ),
              Text(
                '${widget.result.recurrence.bonus < 0 ? '-' : ''}\$${(widget.result.recurrence.bonus).abs().toStringAsFixed(2)}',
                style: textStyle,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Newer Bonus (-0%)',
                style: textStyle,
              ),
              Text(
                '${widget.result.bonusNewer < 0 ? '-' : ''}\$${(widget.result.bonusNewer).abs().toStringAsFixed(2)}',
                style: textStyle,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Promotions Bonus (-0%)',
                style: textStyle,
              ),
              Text(
                '${widget.result.bonusPromotions < 0 ? '-' : ''}\$${(widget.result.bonusPromotions).abs().toStringAsFixed(2)}',
                style: textStyle,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'In Wallet: ${widget.result.bonusWallet < 0 ? '-' : ''}\$${(widget.result.bonusWallet).abs().toInt()}',
                style: textStyle,
              ),
              Container(
                width: 68,
                height: 36,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(76, 34, 141, 0.13),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '${(widget.result.bonusWallet).toInt()}',
                          style: textStyle,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(31, 30, 51, 0.08),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset("assets/images/dollar_sign.png"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Custom Parameters',
                style: textStyle,
              ),
              Text(
                '\$${(widget.result.extraprice).toStringAsFixed(2)}',
                style: textStyle,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(28, 28, 28, 0.4)),
              ),
              Text(
                '\$${widget.result.totalprice.toStringAsFixed(2)} USD',
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(28, 28, 28, 1)),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
