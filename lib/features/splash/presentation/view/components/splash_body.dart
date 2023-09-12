import 'package:bookly/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'logo',
        child: SvgPicture.asset(
          SvgUtils.logo,
          height: 35,
        ),
      ),
    );
  }
}
