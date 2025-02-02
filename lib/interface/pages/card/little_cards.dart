import 'package:flutter/material.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LittleCards extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int id;
  final int type;

  const LittleCards(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.type,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 242,
      child: InkWell(
        onTap: () {
          if (type == 1) {
            context.go('/serie/$id');
          }
          if (type == 2) {
            context.go('/issue/$id');
          }
          if (type == 3) {
            context.go('/movie/$id');
          }
        },
        child: Card(
          color: AppColors.cardElementBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                height: 177,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  title,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
