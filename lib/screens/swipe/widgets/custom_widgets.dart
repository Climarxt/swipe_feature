import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';


EdgeInsets swiperPaddingLeft() => const EdgeInsets.only(
      left: 0,
      right: 7.5,
      bottom: 7.5,
      top: 0,
    );

EdgeInsets swiperPaddingRight() => const EdgeInsets.only(
      left: 7.5,
      right: 0,
      bottom: 7.5,
      top: 0,
    );

AllowedSwipeDirection allowedSwipeDirection() =>
    const AllowedSwipeDirection.only(
        up: true, left: false, down: true, right: false);
