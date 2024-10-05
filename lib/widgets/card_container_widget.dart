import 'package:flutter/material.dart';

class CardContainerWidget extends StatelessWidget {
  static const routeName = 'my_orders_screen';
  final String title;
  final List<Widget> cards;

  const CardContainerWidget({
    Key? key,
    required this.title,
    required this.cards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
          children: cards,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
