import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class HomeCampusNews extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const HomeCampusNews({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 230,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 130,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    imgUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
