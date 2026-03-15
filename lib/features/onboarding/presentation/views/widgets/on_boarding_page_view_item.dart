import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_prefrences_singelton.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';

class OnBoardingViewItem extends StatelessWidget {
  const OnBoardingViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.title,
      required this.subTitle,
      required this.currentPage});

  final String image, backgroundImage, subTitle;
  final Widget title;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// stack
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .5,
          child: Stack(
            children: [
              SvgPicture.asset(backgroundImage),
              Positioned(
                  bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image)),
              Visibility(
                visible: currentPage == 0 ? true : false,
                child: GestureDetector(
                  onTap: (){
                    Prefs.setBool(isOnBoardingSeen, true);
                    Navigator.pushReplacementNamed(context, LoginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('تخط' , style: TextStyle(color: Colors.grey.shade400 , fontSize: 13),),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 60,
        ),


        /// Title
        title,

        const SizedBox(
          height: 24,
        ),


        /// subTitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subTitle,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4E5556)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
