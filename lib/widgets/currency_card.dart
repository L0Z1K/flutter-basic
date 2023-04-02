import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.currency,
    required this.currencyType,
    required this.currencyIcon,
    required this.amount,
    required this.offset,
  });

  final Color textColor;
  final Color backgroundColor;
  final String currency;
  final String currencyType;
  final IconData currencyIcon;
  final String amount;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offset),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        currencyType,
                        style: TextStyle(
                          color: textColor.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(3, 14),
                  child: Icon(
                    currencyIcon,
                    color: textColor.withOpacity(0.8),
                    size: 90,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
