import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../res/app_colors.dart';

class ListInWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String nb;

  const ListInWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.nb,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 350,
          child: Card(
            color: AppColors.gray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                Image(
                    image: NetworkImage(this.imageUrl),
                    width: 100,
                    height: 100),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    this.title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
