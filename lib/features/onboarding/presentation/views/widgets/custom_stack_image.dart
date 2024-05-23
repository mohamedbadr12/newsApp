import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomStackImage extends StatelessWidget {
  final String image;
  final String text;

  const CustomStackImage({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black45, Colors.transparent])),
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Discover $text',
                          style: Styles.textStyle30SemiBold(context)),
                      const SizedBox(
                        height: 40,
                      ),
                      Text('and explore beyond',
                          style: Styles.textStyle30SemiBold(context)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
