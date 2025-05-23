import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/config/huuua_ui_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum ManageBibleType {
  bible(0),
  language(1),
  countries(2);

  const ManageBibleType(this.value);
  final num value;
}

class SearchBibleTypeSegment extends GetView<SearchController> {
  final ValueChanged<int>? onSegmentTapped;
  final ManageBibleType manageBibleType;

  Map<int, String> segmentlist = {0: '圣经', 1: '语言', 2: '国家'};

  SearchBibleTypeSegment({
    required this.onSegmentTapped,
    this.manageBibleType = ManageBibleType.bible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: GetTheme(HuuuaColorEnum.backgroundColor),
      padding: EdgeInsets.only(
        left: horizontalPadding15.w,
        right: horizontalPadding15.w,
      ),
      child: Row(
        children: [
          itemWidget(
            title: segmentlist[0]!,
            isSelected: manageBibleType == ManageBibleType.bible,
            type: ManageBibleType.bible,
          ),
          itemWidget(
            title: segmentlist[1]!,
            isSelected: manageBibleType == ManageBibleType.language,
            type: ManageBibleType.language,
          ),
          itemWidget(
            title: segmentlist[2]!,
            isSelected: manageBibleType == ManageBibleType.countries,
            type: ManageBibleType.countries,
          ),
        ],
      ),
    );
  }

  Widget itemWidget({
    required String title,
    required bool isSelected,
    required ManageBibleType type,
  }) {
    return TextButton(
      onPressed: () {
        onSegmentTapped!(type.index);
      },
      child: Text(title),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size((Get.width - horizontalPadding15 * 2) / 3, double.infinity),
        ),
        // padding:
        //     MaterialStateProperty.all(EdgeInsets.only(left: 20, right: 20)),
        backgroundColor: MaterialStateProperty.all(
          isSelected
              ? GetTheme(HuuuaColorEnum.color_000000)
              : GetTheme(HuuuaColorEnum.backgroundColor),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
