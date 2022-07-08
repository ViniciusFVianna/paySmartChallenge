import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utilities/app_colors.dart';

class ListLoader extends StatelessWidget {
  const ListLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.colorPrimary,
      highlightColor: AppColors.colorSecondary,
      child: Container(
        height: 150,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.colorPrimary,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 250,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.colorPrimary,
                    )),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.colorPrimary,
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.colorPrimary,
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.colorPrimary,
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.colorPrimary,
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.colorPrimary,
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.colorPrimary,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    width: 250,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.colorPrimary,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
