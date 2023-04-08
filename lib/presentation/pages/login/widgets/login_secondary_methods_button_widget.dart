import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginSecondaryMethodsButtonWidget extends StatelessWidget {
  final String iconPath;
  final Function() onTap;
  const LoginSecondaryMethodsButtonWidget({
    super.key,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: context.width,
        height: 56,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              13,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(
                13,
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(iconPath,
                    colorFilter: ColorFilter.mode(
                        Get.theme.primaryColor, BlendMode.srcIn)),
              ),
            ),
          ),
        ),
      );
}
