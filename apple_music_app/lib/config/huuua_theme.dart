import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HuuuaColorEnum {
  backgroundColor, //默认页面背景色
  appBarbackgroundColor, //默认appBar背景色
  readBackgroundColor, //阅读界面背景
  defaultColor, //默认背景色
  cardColor, //卡片颜色
  prefsBarItemBackgroundColor, //阅读设置项背景颜色
  defaultTextColor, //默认字体颜色
  unTouchTextColor, //按钮不可点击字体颜色
  iconColor, //icon颜色
  catalogItemSelectedColor, //目录选中状态颜色
  celllineColor, //行分割线颜色
  textColor_717777,
  button_backgroundColor,
  textColor_white,
  master_color, //主色调

  input_counter_text_color, //输入框字数提示颜色
  input_hint_text_color, //输入框hint颜色
  input_text_color, //输入框字体颜色

  input_backgroundcolor, //输入框背景

  color_999999,
  color_F9F9F9,
  color_FFFFFF_90,
  color_FFD600,
  color_FFD600_10,
  color_FFD600_19,
  color_FFD600_15,
  color_EEEEEE,
  color_666666,
  color_FF324B,
  color_FF324B_70,
  color_989FB0,
  color_000000,
  color_FFFFFF,
  color_FFFFFF_70,
  color_000000_15,
  color_AAAAAA,
  color_FFEE93,
  color_FFFBE6,
  color_0F36FF,

  read_color, //阅读界面主色
  read_background_color, //阅读背景色
  read_color_FFFFFF_50,
  read_color_666666, //阅读界面颜色
  read_color_FF324B,
  read_color_000000,
  read_color_000000_15,
  read_color_000000_45,
  read_color_FFFFFF,
  read_color_AAAAAA,

  read_text_default_color, // 阅读界面默认字体颜色
  read_icon_A_color, //阅读界面字体大小A图标颜色
  read_text_size_slider_inactiveDividerColor, //阅读界面字体大小slider背景色
  read_button_color, //阅读界面按钮背景色
  read_theme_btn_border_color, //阅读界面主题按钮border
  read_content_color, //阅读界面内容颜色
  read_line_height_normal_color,
}

Color GetTheme(HuuuaColorEnum huuuaColorEnum) {
  return Get.theme.extension<HuuuaCustomColors>()!.get(huuuaColorEnum);
}

final HuuuaThemeLight = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    HuuuaCustomColors(const {
      HuuuaColorEnum.master_color: Color.fromRGBO(250, 23, 55, 1),
      HuuuaColorEnum.cardColor: Color.fromRGBO(237, 245, 247, 1),
      HuuuaColorEnum.defaultColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.textColor_717777: Color.fromRGBO(71, 77, 77, 1),
      HuuuaColorEnum.backgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.appBarbackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.readBackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.prefsBarItemBackgroundColor: Color.fromRGBO(
        244,
        244,
        244,
        1,
      ),

      HuuuaColorEnum.input_counter_text_color: Color.fromRGBO(
        100,
        100,
        100,
        1,
      ), //输入框字数提示颜色
      HuuuaColorEnum.input_hint_text_color: Color.fromRGBO(
        155,
        155,
        155,
        1,
      ), //输入框hint颜色
      HuuuaColorEnum.input_text_color: Color.fromRGBO(0, 0, 0, 1), //输入框字体颜色
      HuuuaColorEnum.input_backgroundcolor: Color.fromRGBO(247, 248, 252, 1),

      HuuuaColorEnum.textColor_white: Color.fromRGBO(244, 244, 244, 1),
      HuuuaColorEnum.button_backgroundColor: Color.fromRGBO(200, 200, 200, 1),
      HuuuaColorEnum.defaultTextColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.iconColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.catalogItemSelectedColor: Color(0xFF00C29A),
      HuuuaColorEnum.unTouchTextColor: Color.fromRGBO(150, 150, 150, 1),
      HuuuaColorEnum.celllineColor: Colors.black54,
      HuuuaColorEnum.color_989FB0: Color(0xFF989FB0),
      HuuuaColorEnum.color_FFD600: Color(0xFFFFD600),
      HuuuaColorEnum.color_EEEEEE: Color(0xFFEEEEEE),
      HuuuaColorEnum.color_999999: Color(0xFF999999),
      HuuuaColorEnum.color_000000: Color(0xFF000000),
      HuuuaColorEnum.color_000000_15: Color(0x15000000),
      HuuuaColorEnum.color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.color_F9F9F9: Color(0xFFF9F9F9),
      HuuuaColorEnum.color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.color_FF324B_70: Color(0x70FF324B),
      HuuuaColorEnum.color_FFFFFF_90: Color(0x90FFFFFF),
      HuuuaColorEnum.color_666666: Color(0xFF666666),
      HuuuaColorEnum.color_FFEE93: Color(0xFFFFEE93),
      HuuuaColorEnum.color_FFD600_10: Color(0x10FFD600),
      HuuuaColorEnum.color_FFFBE6: Color(0xFFFFFBE6),
      HuuuaColorEnum.color_FFD600_19: Color(0x19FFD600),
      HuuuaColorEnum.color_FFD600_15: Color(0x15FFD600),

      HuuuaColorEnum.color_FFFFFF_70: Color(0x70FFFFFF),
      HuuuaColorEnum.color_0F36FF: Color(0xFF0F36FF),
      HuuuaColorEnum.read_color_666666: Color(0xFF666666),
      HuuuaColorEnum.read_color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.read_color_000000_45: Color(0x45000000),
      HuuuaColorEnum.read_color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_color: Color(0xFFEAEAEF), //阅读界面主色调
      HuuuaColorEnum.read_background_color: Color(0xFFEAEAEF), //阅读界面背景色
      HuuuaColorEnum.read_color_FFFFFF_50: Color(0x50FFFFFF),
      HuuuaColorEnum.read_color_000000: Color(0xFF000000),
      HuuuaColorEnum.read_color_000000_15: Color(0x15000000),
      HuuuaColorEnum.read_color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_default_color: Color(0xFF000000),
      HuuuaColorEnum.read_icon_A_color: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_size_slider_inactiveDividerColor: Color(
        0xFFEEEEEE,
      ),
      HuuuaColorEnum.read_button_color: Color(0x50FFFFFF),
      HuuuaColorEnum.read_theme_btn_border_color: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_content_color: Color(0xFF000000),
      HuuuaColorEnum.read_line_height_normal_color: Color(0xFFAAAAAA),
    }),
  ],
);

final HuuuaThemeDark = ThemeData.dark().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    HuuuaCustomColors(const {
      HuuuaColorEnum.master_color: Color.fromRGBO(250, 23, 55, 1),
      HuuuaColorEnum.cardColor: Color.fromRGBO(237, 245, 247, 1),
      HuuuaColorEnum.defaultColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.backgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.textColor_717777: Color.fromRGBO(71, 77, 77, 1),
      HuuuaColorEnum.appBarbackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.readBackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.prefsBarItemBackgroundColor: Color.fromRGBO(
        244,
        244,
        244,
        1,
      ),

      HuuuaColorEnum.input_counter_text_color: Color.fromRGBO(
        100,
        100,
        100,
        1,
      ), //输入框字数提示颜色
      HuuuaColorEnum.input_hint_text_color: Color.fromRGBO(
        122,
        122,
        122,
        1,
      ), //输入框hint颜色
      HuuuaColorEnum.input_text_color: Color.fromRGBO(0, 0, 0, 1), //输入框字体颜色
      HuuuaColorEnum.input_backgroundcolor: Color.fromRGBO(247, 248, 252, 1),

      HuuuaColorEnum.textColor_white: Color.fromRGBO(244, 244, 244, 1),
      HuuuaColorEnum.defaultTextColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.iconColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.catalogItemSelectedColor: Color(0xFF00C29A),
      HuuuaColorEnum.unTouchTextColor: Color.fromRGBO(150, 150, 150, 1),
      HuuuaColorEnum.celllineColor: Colors.black54,
      HuuuaColorEnum.color_989FB0: Color(0xFF989FB0),
      HuuuaColorEnum.color_FFD600: Color(0xFFFFD600),
      HuuuaColorEnum.color_EEEEEE: Color(0xFFEEEEEE),
      HuuuaColorEnum.color_999999: Color(0xFF999999),
      HuuuaColorEnum.color_000000: Color(0xFF000000),
      HuuuaColorEnum.color_000000_15: Color(0x15000000),
      HuuuaColorEnum.color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.color_F9F9F9: Color(0xFFF9F9F9),
      HuuuaColorEnum.color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.color_FF324B_70: Color(0x70FF324B),
      HuuuaColorEnum.color_FFFFFF_90: Color(0x90FFFFFF),
      HuuuaColorEnum.color_666666: Color(0xFF666666),
      HuuuaColorEnum.color_FFEE93: Color(0xFFFFEE93),
      HuuuaColorEnum.color_FFD600_10: Color(0x10FFD600),
      HuuuaColorEnum.color_FFFBE6: Color(0xFFFFFBE6),
      HuuuaColorEnum.color_FFD600_19: Color(0x19FFD600),
      HuuuaColorEnum.color_FFD600_15: Color(0x15FFD600),
      HuuuaColorEnum.color_FFFFFF_70: Color(0x70FFFFFF),
      HuuuaColorEnum.color_0F36FF: Color(0xFF0F36FF),
      HuuuaColorEnum.read_color_666666: Color(0xFF666666),
      HuuuaColorEnum.read_color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.read_color_000000_45: Color(0x45000000),
      HuuuaColorEnum.read_color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_color: Color(0xFF161817),
      HuuuaColorEnum.read_color_FFFFFF_50: Color(0x50FFFFFF),
      HuuuaColorEnum.read_color_000000: Color(0xFF000000),
      HuuuaColorEnum.read_color_000000_15: Color(0x15000000),
      HuuuaColorEnum.read_color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_default_color: Color(0xFF666666),
      HuuuaColorEnum.read_icon_A_color: Color(0xFF666666),
      HuuuaColorEnum.read_text_size_slider_inactiveDividerColor: Color(
        0xFF666666,
      ),
      HuuuaColorEnum.read_button_color: Color(0xFF1F2120),
      HuuuaColorEnum.read_theme_btn_border_color: Color(0xFF666666),
      HuuuaColorEnum.read_background_color: Color(0xFF1F2120),
      HuuuaColorEnum.read_content_color: Color(0xFF868887),
      HuuuaColorEnum.read_line_height_normal_color: Color(0xFF666666),
    }),
  ],
);

final HuuuaThemeFFF2EF = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    HuuuaCustomColors(const {
      HuuuaColorEnum.master_color: Color.fromRGBO(250, 23, 55, 1),
      HuuuaColorEnum.cardColor: Color.fromRGBO(237, 245, 247, 1),
      HuuuaColorEnum.defaultColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.backgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.textColor_717777: Color.fromRGBO(71, 77, 77, 1),
      HuuuaColorEnum.appBarbackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.readBackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.prefsBarItemBackgroundColor: Color.fromRGBO(
        244,
        244,
        244,
        1,
      ),
      HuuuaColorEnum.textColor_white: Color.fromRGBO(244, 244, 244, 1),
      HuuuaColorEnum.defaultTextColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.iconColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.catalogItemSelectedColor: Color(0xFF00C29A),
      HuuuaColorEnum.unTouchTextColor: Color.fromRGBO(150, 150, 150, 1),
      HuuuaColorEnum.celllineColor: Colors.black54,
      HuuuaColorEnum.color_989FB0: Color(0xFF989FB0),
      HuuuaColorEnum.color_FFD600: Color(0xFFFFD600),
      HuuuaColorEnum.color_EEEEEE: Color(0xFFEEEEEE),
      HuuuaColorEnum.color_999999: Color(0xFF999999),
      HuuuaColorEnum.color_000000: Color(0xFF000000),
      HuuuaColorEnum.color_000000_15: Color(0x15000000),
      HuuuaColorEnum.color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.color_F9F9F9: Color(0xFFF9F9F9),
      HuuuaColorEnum.color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.color_FF324B_70: Color(0x70FF324B),
      HuuuaColorEnum.color_FFFFFF_90: Color(0x90FFFFFF),
      HuuuaColorEnum.color_666666: Color(0xFF666666),
      HuuuaColorEnum.color_FFEE93: Color(0xFFFFEE93),
      HuuuaColorEnum.color_FFD600_10: Color(0x10FFD600),
      HuuuaColorEnum.color_FFFBE6: Color(0xFFFFFBE6),
      HuuuaColorEnum.color_FFD600_19: Color(0x19FFD600),
      HuuuaColorEnum.color_FFFFFF_70: Color(0x70FFFFFF),
      HuuuaColorEnum.color_0F36FF: Color(0xFF0F36FF),
      HuuuaColorEnum.read_color_666666: Color(0xFF666666),
      HuuuaColorEnum.read_color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.read_color_000000_45: Color(0x45000000),
      HuuuaColorEnum.read_color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_color: Color(0xFFFFF2EF), //阅读界面主色调
      HuuuaColorEnum.read_background_color: Color(0xFFFFF2EF), //阅读界面背景色
      HuuuaColorEnum.read_color_FFFFFF_50: Color(0x50FFFFFF),
      HuuuaColorEnum.read_color_000000: Color(0xFF000000),
      HuuuaColorEnum.read_color_000000_15: Color(0x15000000),
      HuuuaColorEnum.read_color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_default_color: Color(0xFF000000),
      HuuuaColorEnum.read_icon_A_color: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_size_slider_inactiveDividerColor: Color(
        0xFFEEEEEE,
      ),
      HuuuaColorEnum.read_button_color: Color(0x50FFFFFF),
      HuuuaColorEnum.read_theme_btn_border_color: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_content_color: Color(0xFF000000),
      HuuuaColorEnum.read_line_height_normal_color: Color(0xFFAAAAAA),
    }),
  ],
);

final HuuuaThemeE8FFE8 = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    HuuuaCustomColors(const {
      HuuuaColorEnum.master_color: Color.fromRGBO(250, 23, 55, 1),
      HuuuaColorEnum.cardColor: Color.fromRGBO(237, 245, 247, 1),
      HuuuaColorEnum.defaultColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.backgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.textColor_717777: Color.fromRGBO(71, 77, 77, 1),
      HuuuaColorEnum.appBarbackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.readBackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.prefsBarItemBackgroundColor: Color.fromRGBO(
        244,
        244,
        244,
        1,
      ),
      HuuuaColorEnum.textColor_white: Color.fromRGBO(244, 244, 244, 1),
      HuuuaColorEnum.defaultTextColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.iconColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.catalogItemSelectedColor: Color(0xFF00C29A),
      HuuuaColorEnum.unTouchTextColor: Color.fromRGBO(150, 150, 150, 1),
      HuuuaColorEnum.celllineColor: Colors.black54,
      HuuuaColorEnum.color_989FB0: Color(0xFF989FB0),
      HuuuaColorEnum.color_FFD600: Color(0xFFFFD600),
      HuuuaColorEnum.color_EEEEEE: Color(0xFFEEEEEE),
      HuuuaColorEnum.color_999999: Color(0xFF999999),
      HuuuaColorEnum.color_000000: Color(0xFF000000),
      HuuuaColorEnum.color_000000_15: Color(0x15000000),
      HuuuaColorEnum.color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.color_F9F9F9: Color(0xFFF9F9F9),
      HuuuaColorEnum.color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.color_FF324B_70: Color(0x70FF324B),
      HuuuaColorEnum.color_FFFFFF_90: Color(0x90FFFFFF),
      HuuuaColorEnum.color_666666: Color(0xFF666666),
      HuuuaColorEnum.color_FFEE93: Color(0xFFFFEE93),
      HuuuaColorEnum.color_FFD600_10: Color(0x10FFD600),
      HuuuaColorEnum.color_FFFBE6: Color(0xFFFFFBE6),
      HuuuaColorEnum.color_FFD600_19: Color(0x19FFD600),
      HuuuaColorEnum.color_FFFFFF_70: Color(0x70FFFFFF),
      HuuuaColorEnum.color_0F36FF: Color(0xFF0F36FF),
      HuuuaColorEnum.read_color_666666: Color(0xFF666666),
      HuuuaColorEnum.read_color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.read_color_000000_45: Color(0x45000000),
      HuuuaColorEnum.read_color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_color: Color(0xFFE8FFE8), //阅读界面主色调
      HuuuaColorEnum.read_background_color: Color(0xFFE8FFE8), //阅读界面背景色
      HuuuaColorEnum.read_color_FFFFFF_50: Color(0x50FFFFFF),
      HuuuaColorEnum.read_color_000000: Color(0xFF000000),
      HuuuaColorEnum.read_color_000000_15: Color(0x15000000),
      HuuuaColorEnum.read_color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_default_color: Color(0xFF000000),
      HuuuaColorEnum.read_icon_A_color: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_size_slider_inactiveDividerColor: Color(
        0xFFEEEEEE,
      ),
      HuuuaColorEnum.read_button_color: Color(0x50FFFFFF),
      HuuuaColorEnum.read_theme_btn_border_color: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_content_color: Color(0xFF000000),
      HuuuaColorEnum.read_line_height_normal_color: Color(0xFFAAAAAA),
    }),
  ],
);

final HuuuaThemeE3EDCD = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    HuuuaCustomColors(const {
      HuuuaColorEnum.master_color: Color.fromRGBO(250, 23, 55, 1),
      HuuuaColorEnum.cardColor: Color.fromRGBO(237, 245, 247, 1),
      HuuuaColorEnum.defaultColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.backgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.textColor_717777: Color.fromRGBO(71, 77, 77, 1),
      HuuuaColorEnum.appBarbackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.readBackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.prefsBarItemBackgroundColor: Color.fromRGBO(
        244,
        244,
        244,
        1,
      ),
      HuuuaColorEnum.textColor_white: Color.fromRGBO(244, 244, 244, 1),
      HuuuaColorEnum.defaultTextColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.iconColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.catalogItemSelectedColor: Color(0xFF00C29A),
      HuuuaColorEnum.unTouchTextColor: Color.fromRGBO(150, 150, 150, 1),
      HuuuaColorEnum.celllineColor: Colors.black54,
      HuuuaColorEnum.color_989FB0: Color(0xFF989FB0),
      HuuuaColorEnum.color_FFD600: Color(0xFFFFD600),
      HuuuaColorEnum.color_EEEEEE: Color(0xFFEEEEEE),
      HuuuaColorEnum.color_999999: Color(0xFF999999),
      HuuuaColorEnum.color_000000: Color(0xFF000000),
      HuuuaColorEnum.color_000000_15: Color(0x15000000),
      HuuuaColorEnum.color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.color_F9F9F9: Color(0xFFF9F9F9),
      HuuuaColorEnum.color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.color_FF324B_70: Color(0x70FF324B),
      HuuuaColorEnum.color_FFFFFF_90: Color(0x90FFFFFF),
      HuuuaColorEnum.color_666666: Color(0xFF666666),
      HuuuaColorEnum.color_FFEE93: Color(0xFFFFEE93),
      HuuuaColorEnum.color_FFD600_10: Color(0x10FFD600),
      HuuuaColorEnum.color_FFFBE6: Color(0xFFFFFBE6),
      HuuuaColorEnum.color_FFD600_19: Color(0x19FFD600),
      HuuuaColorEnum.color_FFFFFF_70: Color(0x70FFFFFF),
      HuuuaColorEnum.color_0F36FF: Color(0xFF0F36FF),
      HuuuaColorEnum.read_color_666666: Color(0xFF666666),
      HuuuaColorEnum.read_color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.read_color_000000_45: Color(0x45000000),
      HuuuaColorEnum.read_color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_color: Color(0xFFE3EDCD), //阅读界面主色调
      HuuuaColorEnum.read_background_color: Color(0xFFE3EDCD), //阅读界面背景色
      HuuuaColorEnum.read_color_FFFFFF_50: Color(0x50FFFFFF),
      HuuuaColorEnum.read_color_000000: Color(0xFF000000),
      HuuuaColorEnum.read_color_000000_15: Color(0x15000000),
      HuuuaColorEnum.read_color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_default_color: Color(0xFF000000),
      HuuuaColorEnum.read_icon_A_color: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_size_slider_inactiveDividerColor: Color(
        0xFFEEEEEE,
      ),
      HuuuaColorEnum.read_button_color: Color(0x50FFFFFF),
      HuuuaColorEnum.read_theme_btn_border_color: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_content_color: Color(0xFF000000),
      HuuuaColorEnum.read_line_height_normal_color: Color(0xFFAAAAAA),
    }),
  ],
);

final HuuuaThemeFAF9DE = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    HuuuaCustomColors(const {
      HuuuaColorEnum.master_color: Color.fromRGBO(250, 23, 55, 1),
      HuuuaColorEnum.cardColor: Color.fromRGBO(237, 245, 247, 1),
      HuuuaColorEnum.defaultColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.backgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.textColor_717777: Color.fromRGBO(71, 77, 77, 1),
      HuuuaColorEnum.appBarbackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.readBackgroundColor: Color.fromRGBO(249, 255, 255, 1),
      HuuuaColorEnum.prefsBarItemBackgroundColor: Color.fromRGBO(
        244,
        244,
        244,
        1,
      ),
      HuuuaColorEnum.textColor_white: Color.fromRGBO(244, 244, 244, 1),
      HuuuaColorEnum.defaultTextColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.iconColor: Color.fromRGBO(31, 31, 31, 1),
      HuuuaColorEnum.catalogItemSelectedColor: Color(0xFF00C29A),
      HuuuaColorEnum.unTouchTextColor: Color.fromRGBO(150, 150, 150, 1),
      HuuuaColorEnum.celllineColor: Colors.black54,
      HuuuaColorEnum.color_989FB0: Color(0xFF989FB0),
      HuuuaColorEnum.color_FFD600: Color(0xFFFFD600),
      HuuuaColorEnum.color_EEEEEE: Color(0xFFEEEEEE),
      HuuuaColorEnum.color_999999: Color(0xFF999999),
      HuuuaColorEnum.color_000000: Color(0xFF000000),
      HuuuaColorEnum.color_000000_15: Color(0x15000000),
      HuuuaColorEnum.color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.color_F9F9F9: Color(0xFFF9F9F9),
      HuuuaColorEnum.color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.color_FF324B_70: Color(0x70FF324B),
      HuuuaColorEnum.color_FFFFFF_90: Color(0x90FFFFFF),
      HuuuaColorEnum.color_666666: Color(0xFF666666),
      HuuuaColorEnum.color_FFEE93: Color(0xFFFFEE93),
      HuuuaColorEnum.color_FFD600_10: Color(0x10FFD600),
      HuuuaColorEnum.color_FFFBE6: Color(0xFFFFFBE6),
      HuuuaColorEnum.color_FFD600_19: Color(0x19FFD600),
      HuuuaColorEnum.color_FFFFFF_70: Color(0x70FFFFFF),
      HuuuaColorEnum.color_0F36FF: Color(0xFF0F36FF),
      HuuuaColorEnum.read_color_666666: Color(0xFF666666),
      HuuuaColorEnum.read_color_FF324B: Color(0xFFFF324B),
      HuuuaColorEnum.read_color_000000_45: Color(0x45000000),
      HuuuaColorEnum.read_color_FFFFFF: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_color: Color(0xFFFAF9DE), //阅读界面主色调
      HuuuaColorEnum.read_background_color: Color(0xFFFAF9DE), //阅读界面背景色
      HuuuaColorEnum.read_color_FFFFFF_50: Color(0x50FFFFFF),
      HuuuaColorEnum.read_color_000000: Color(0xFF000000),
      HuuuaColorEnum.read_color_000000_15: Color(0x15000000),
      HuuuaColorEnum.read_color_AAAAAA: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_default_color: Color(0xFF000000),
      HuuuaColorEnum.read_icon_A_color: Color(0xFFAAAAAA),
      HuuuaColorEnum.read_text_size_slider_inactiveDividerColor: Color(
        0xFFEEEEEE,
      ),
      HuuuaColorEnum.read_button_color: Color(0x50FFFFFF),
      HuuuaColorEnum.read_theme_btn_border_color: Color(0xFFFFFFFF),
      HuuuaColorEnum.read_content_color: Color(0xFF000000),
      HuuuaColorEnum.read_line_height_normal_color: Color(0xFFAAAAAA),
    }),
  ],
);

@immutable
class HuuuaCustomColors<T> extends ThemeExtension<HuuuaCustomColors> {
  HuuuaCustomColors(this._colors);

  final Map<T, Color?> _colors;

  Color get(T name) =>
      _colors[name] ??
      (throw ArgumentError("Color $name does not exits. 颜色没找到"));

  // Color get(StatusColors name) =>
  //     _colors[name] ??
  //         (throw ArgumentError("Color $name does not exits. 颜色没找到"));

  @override
  HuuuaCustomColors<T> lerp(
    ThemeExtension<HuuuaCustomColors>? other,
    double t,
  ) {
    if (other is! HuuuaCustomColors) {
      return this;
    }

    final Map<T, Color?> lerped = <T, Color?>{};

    _colors.forEach((T key, Color? color) {
      lerped[key] = Color.lerp(color, other.get(key), t);
    });

    other._colors.forEach((key, color) {
      lerped[key] = Color.lerp(get(key), color, t);
    });
    // other._colors.forEach((T key, Color? color) {
    //   // lerped[key] = Color.lerp(get(key), color, t);
    // });

    return HuuuaCustomColors<T>(lerped);
  }

  // @override
  // bool operator ==(Object other) {}

  @override
  int get hashCode;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {}

  // @override
  // ThemeExtension<ThemeExtension> copyWith() {
  //   // TODO: implement copyWith
  //   throw UnimplementedError();
  // }

  @override
  HuuuaCustomColors copyWith({Map<T, Color?>? colors}) {
    return HuuuaCustomColors(colors!);
  }
}
