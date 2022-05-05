import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/themes/themes.dart';



class AppButton extends StatefulWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    this.isLoadable = true,
    this.title = '',
    this.textSize = 15,
    this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
    this.borderRadius = 5,
    this.bckgrndColor = AppColors.catalinaBlue,
    this.fontColor = AppColors.appBlack,
  }) : super(key: key);

  final Function() onPressed;
  final String title;
  final bool isLoadable;
  final double textSize;
  final EdgeInsets padding;
  final Color bckgrndColor;
  final Color fontColor;

  final double borderRadius;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (widget.isLoadable) {
          setState(() {
            isLoading = true;
          });
          await widget.onPressed();
          setState(() {
            isLoading = false;
          });
        } else {
          widget.onPressed();
        }
      },
      child: Container(
        padding: widget.padding * 0.8,
        decoration: BoxDecoration(
          color: widget.bckgrndColor,
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: isLoading ? 0 : 1,
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.button.copyWith(
                    fontSize: widget.textSize,
                    fontWeight: FontWeight.w600,
                    color: widget.fontColor,
                  ),
                ),
              ),
            ),
            Center(
              child: Opacity(
                opacity: !isLoading ? 0 : 1,
                child: SizedBox.square(
                  dimension: widget.textSize,
                  child: CircularProgressIndicator(
                    color: widget.fontColor,
                    strokeWidth: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppOutlineButton extends StatefulWidget {
  const AppOutlineButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.borderRadius =8,
    this.border,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.fontSize = 16,
    this.fontColor = AppColors.catalinaBlue,
  }) : super(key: key);
  final String title;
  final Function()? onPressed;
  final double borderRadius;
  final Color fontColor;
  final EdgeInsets padding;
  final double? width;
  final double fontSize;
  final Border? border;

  @override
  State<AppOutlineButton> createState() => _AppOutlineButtonState();
}

class _AppOutlineButtonState extends State<AppOutlineButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        setState(() {
          loading = true;
        });
        await widget.onPressed!();
        setState(() {
          loading = false;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: widget.padding,
        side: const BorderSide(
          width: 1.5,
          color: AppColors.catalinaBlue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      child: Center(
        child: Stack(
          children: [
            Opacity(
              opacity: loading ? 0 : 1,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.bodyText1!.copyWith(
                  color: widget.fontColor,
                  fontSize: widget.fontSize * Get.textScaleFactor * 0.92 ,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: !loading ? 0 : 1,
                  child: SizedBox.square(
                    dimension: widget.fontSize,
                    child: CircularProgressIndicator(
                      color: widget.fontColor,
                      strokeWidth: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
