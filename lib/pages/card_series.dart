import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class CardSeries extends StatelessWidget {
  const CardSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Container(
          height: 162,
          width: 359,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 49, 73),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://lh6.googleusercontent.com/proxy/4HcFYRNNfZRWgdocSS1mVMW_RDmfPy6PIGyhw1IXoXwZGDY3HkG0a3mUSn5Om-qoMAZVHHGoHqknt28PnZNHSPr5LVzj-r2MBINGg21RWJOjNZ2CIOBB2g4Bgn0FS3779ndQnNem6o-rg3bjYyw4',
                          height: 131,
                          width: 129,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 59,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '#1',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Agents of Shield',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.movie_edit,
                            color: AppColors.grey,
                            size: 17,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Marvel',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          Icon(
                            Icons.tv_outlined,
                            color: AppColors.grey,
                            size: 17,
                          ),
                          SizedBox(width: 6),
                          Text(
                            '136 épisodes',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: AppColors.grey,
                            size: 17,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Mai 1970',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
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
