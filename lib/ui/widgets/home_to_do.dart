import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class HomeToDo extends StatelessWidget {
  final String title;
  final String status;
  final String date;
  final VoidCallback? onTap;

  const HomeToDo({
    super.key,
    required this.title,
    required this.status,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/ic_tugas.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        status,
                        style: (status == 'Completed')
                            ? blueTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: light,
                              )
                            : redTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: light,
                              ),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (status == 'Completed') ? whiteColor : redColor,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        date,
                        style: greyTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: light,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 6,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: greySoftColor,
                width: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
