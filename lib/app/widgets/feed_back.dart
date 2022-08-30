import 'package:expo/app/models/enum.dart';
import 'package:expo/utils/object_util.dart';
import 'package:flutter/material.dart';
import 'package:expo/common/config/data_config.dart';
import 'package:expo/utils/common_util.dart';

class FeedBack extends StatelessWidget {
  final ImageType imageType;
  final String? description;

  final bool showButton;
  final String? buttonText;
  final VoidCallback onTap;

  const FeedBack({
    Key? key,
    this.imageType = ImageType.loading,
    this.description,
    this.showButton = false,
    this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageList[imageType.index],
            width: CommonUtils.toRpx(context, 215),
            fit: BoxFit.fitWidth,
          ),
          Offstage(
            offstage: ObjectUtil.isEmptyString(description),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('$description'),
            ),
          ),
          Offstage(
              offstage: !showButton || ObjectUtil.isEmptyString(buttonText),
              child: Column(children: [
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: onTap,
                  style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),
                  child: Text('$buttonText'),
                )
              ]))
        ],
      ),
    );
  }
}
