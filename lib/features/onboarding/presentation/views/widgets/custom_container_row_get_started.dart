import 'package:flutter/material.dart';

import '../../../../../core/app_router/route.dart';
import '../../../../../core/utils/styles.dart';

class CustomContainerGetStarted extends StatelessWidget {
  const CustomContainerGetStarted({
    super.key,
    required this.con,
  });

  final PageController con;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (con.page == 2) {
          Navigator.pushNamed(context, Routes.category);
        } else {
          con.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
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
            gradient: const LinearGradient(
                colors: [Color(0xFF2E2E2D), Color(0x002E2E2D)])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Get Started', style: Styles.textStyle16SemiBold(context)),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFFBEDE61),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: const Center(
                  child: Icon(
                Icons.arrow_forward_ios_sharp,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
