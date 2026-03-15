import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/on_boarding_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnBoardingViewItem(
            currentPage: 0,
            image: 'assets/images/onboarding_page_view1_image.svg',
            backgroundImage:
                'assets/images/onboarding_page_view1_background.svg',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مرحبًا بك في ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'HUB',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xFFF4A91F)),
                ),
                Text('Fruit',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xFF1B5E37))),
              ],
            ),
            subTitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.'),
        OnBoardingViewItem(
            currentPage: 1,
            image: 'assets/images/onboarding_page_view2_image.svg',
            backgroundImage:
                'assets/images/onboarding_page_view2_background_image.svg',
            title: Text('ابحث وتسوق',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                )),
            subTitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية'),
      ],
    );
  }
}
