import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class HomeNewsDetailArticleDescription extends StatelessWidget {
  const HomeNewsDetailArticleDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height *
          0.67, // Position the container at the bottom
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: Styles.textStyle12RegularDescription(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
