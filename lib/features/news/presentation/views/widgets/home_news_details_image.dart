import 'package:flutter/material.dart';

class HomeNewsDetailsImage extends StatelessWidget {
  const HomeNewsDetailsImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(image),
              onError: (_, __) {
                const NetworkImage(
                    "https://t3.ftcdn.net/jpg/00/36/94/26/360_F_36942622_9SUXpSuE5JlfxLFKB1jHu5Z07eVIWQ2W.jpg");
              },
              fit: BoxFit.fill)),
    );
  }
}
