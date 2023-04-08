import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class GlobalGradientButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function()? onTapButton;

  const GlobalGradientButtonWidget({
    super.key,
    required this.buttonText,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTapButton,
          borderRadius: BorderRadius.circular(13),
          child: Ink(
            width: context.width,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                13,
              ),
              gradient: AppColors().primaryGradient,
            ),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: Get.textTheme.labelMedium,
            ),
          ),
        ),
      );
}
