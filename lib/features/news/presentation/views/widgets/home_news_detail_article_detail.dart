import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class HomeNewsDetailArticleDetail extends StatelessWidget {
  const HomeNewsDetailArticleDetail({
    super.key,
    required this.title,
    required this.author,
    required this.date,
  });

  final String title, author, date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.00, 1.00),
          end: Alignment(0, -1),
          colors: [Color(0xFF30312D), Color(0xE530312D), Color(0x001E1F18)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const ShapeDecoration(
                  color: Color(0x47272727),
                  shape: OvalBorder(),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Text(title, maxLines: 2, style: Styles.textStyle24Bold(context)),
            const SizedBox(
              height: 15,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'By', style: Styles.textStyle10Light(context)),
                  const TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                      text: author, style: Styles.textStyle10SemiBold(context)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: AppColors.homeNewsDetailDividerColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Published on $date", style: Styles.textStyle10Light(context))
          ],
        ),
      ),
    );
  }
}
