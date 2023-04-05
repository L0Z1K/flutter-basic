import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  final Color black = const Color(0xFF181818);
  final Color yellow = const Color(0xFFF2B33A);
  final Color white = const Color(0xFFFAFAFA);

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: white.withOpacity(0.8),
                    // size: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hey, Yoon',
                        style: TextStyle(
                          color: white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                "Total Balance",
                style: TextStyle(
                  color: white.withOpacity(0.8),
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "\$5 194 482",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: white,
                  fontSize: 45,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    backgroundColor: yellow,
                    textColor: black,
                    text: "Transfer",
                  ),
                  Button(
                    backgroundColor: const Color(0xFF1F2123),
                    textColor: white,
                    text: "Request",
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Wallets',
                    style: TextStyle(
                        color: white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CurrencyCard(
                textColor: white,
                backgroundColor: const Color(0xFF1F2123),
                currency: "Euro",
                currencyType: "EUR",
                currencyIcon: Icons.euro_rounded,
                amount: "6 428",
                offset: 0,
              ),
              CurrencyCard(
                textColor: black,
                backgroundColor: white,
                currency: "Bitcoin",
                currencyType: "BTC",
                currencyIcon: Icons.currency_bitcoin_rounded,
                amount: "947.2",
                offset: -20,
              ),
              CurrencyCard(
                textColor: white,
                backgroundColor: const Color(0xFF1F2123),
                currency: "Dollar",
                currencyType: "USD",
                currencyIcon: Icons.attach_money_rounded,
                amount: "55 622",
                offset: -40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
