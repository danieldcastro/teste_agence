import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/theme/app_colors.dart';

class GlobalConfirmationAlertDialog {
  static void showDialog(
      {required String messageText, required VoidCallback onTapYes}) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors().darkGreyColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                messageText,
                textAlign: TextAlign.center,
                style: Get.textTheme.labelMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            13,
                          ),
                          color: AppColors().normalBlackColor),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                            13,
                          ),
                          onTap: () => Get.back(),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('Não',
                                textAlign: TextAlign.center,
                                style: Get.textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          13,
                        ),
                        gradient: AppColors().primaryGradient,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                            13,
                          ),
                          onTap: () {
                            Get.back();
                            onTapYes();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('Sim',
                                textAlign: TextAlign.center,
                                style: Get.textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
