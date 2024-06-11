import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../theme/app_theme.dart';

class CommunityShimmer extends StatelessWidget {
  const CommunityShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingL),
        child: Column(
          children: [
            const SizedBox(height: Dimens.spacingS,),
            Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white.withOpacity(.2),
              ),
            ),
            const SizedBox(height: Dimens.spacingL,),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white.withOpacity(.2),
              ),
            ),
            const SizedBox(height: Dimens.spacingXXL2,),
            Container(
              height: 24,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: SizedBox(
                height: Dimens.learningCardHeight,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>  const SizedBox(width: Dimens.spacingXXS),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const TopicFilterItemShimmer();
                  },
                ),
              ),
            ),
            const SizedBox(height: 58,),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) => _cardShimmer(context),
                separatorBuilder: (context, index) => const SizedBox(height: Dimens.spacingM),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardShimmer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spacingM),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(Dimens.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            //Header row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white.withOpacity(.2),
                  ),
                ),
                const SizedBox(width: Dimens.spacingXS,),
                Expanded(
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(Dimens.radius),
                    ),
                  )
                ),
                const SizedBox(width: Dimens.spacingXS,),
                Container(
                  height: 28,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.radius),
                    color: Colors.white.withOpacity(.2),
                  ),
                )
              ],
            ),
            const SizedBox(height: Dimens.spacingXXS,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 40),
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(Dimens.radius),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(Dimens.radius),
                  ),
                )
              ],
            ),
            const SizedBox(height: Dimens.spacingXL,),

            //Body content
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(Dimens.radius),
              ),
            ),
            const SizedBox(height: Dimens.spacingXL,),

            //Buttons
            Container(
              height: 48,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(Dimens.radius),
              ),
            )
          ]
      ),
    );
  }
}

class TopicFilterItemShimmer extends StatelessWidget {
  const TopicFilterItemShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(8.0),
      )
    );
  }
}