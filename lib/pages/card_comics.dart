import 'package:flutter/material.dart';
import 'package:flutter_projet_final/model/list/issuesListModel.dart';
import 'package:flutter_projet_final/res/app_colors.dart';

class CardComics extends StatelessWidget {
  final IssueModel issue;
  final int index;

  const CardComics({super.key, required this.issue, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Container(
          height: 196,
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
                          issue.getImageUrl().mediumUrl ?? 'Image indisponible',
                          height: 163,
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
                        child: Text(
                          '#$index',
                          style: const TextStyle(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        issue.name?.name ?? 'Nom indisponible',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        issue.nameSaga ?? 'Nom saga indisponible',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        children: [
                          Icon(
                            Icons.book,
                            color: AppColors.grey,
                            size: 17,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'N°16',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: AppColors.grey,
                            size: 17,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            issue.date_added.toString().split(' ')[0],
                            style: const TextStyle(
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
