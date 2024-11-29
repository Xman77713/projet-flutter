import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListInWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ListInWidget({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [Image.network(imageUrl), Text(title)]));
  }
}
