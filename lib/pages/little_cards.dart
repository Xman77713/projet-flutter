import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class LittleCards extends StatelessWidget {
  const LittleCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 180,
          height: 242,
          child: Card(
            color: AppColors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.network(
                    'https://i0.wp.com/www.filmspourenfants.net/wp-content/uploads/2018/10/titans-a.jpg?fit=333%2C446&ssl=1',
                    height: 177,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Titans',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
