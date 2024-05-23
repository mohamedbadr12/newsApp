import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

import '../../../../../core/utils/styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeNewsSliverGridContainer extends StatelessWidget {
  const HomeNewsSliverGridContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.date});

  final String image;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF363636),
        borderRadius: BorderRadius.circular(17),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0881D8F1),
            blurRadius: 10.02,
            offset: Offset(0, 12.52),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x1181D8F1),
            blurRadius: 80,
            offset: Offset(0, 100),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  height: 140,
                  image,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Styles.textStyle12Regular(context)
                  .copyWith(color: Colors.white),
              maxLines: 3,
            ),
            Text(
              timeago.format(
                DateTime.parse(date),
              ),
              style: Styles.textStyle10Regular(context)
                  .copyWith(color: AppColors.homeNewsColor),
            ),
            Row(
              children: [
                const Icon(Icons.menu),
                Text("Read More",
                    style: Styles.textStyle12Regular(context)
                        .copyWith(color: Colors.white)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
