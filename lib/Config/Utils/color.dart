import 'package:flutter/material.dart';

import '../Helper/HextoColor.dart';




class AppColors{
  static bool isdarktheme=false;

  static Color PRIMARY_COLOR = HexColor("007AFF");
  static Color ACCENT_COLOR = Colors.black;
  static Color BACKGROUND_COLOR = HexColor("F8F8F8");
  static Color BG_TEXTFIELD_GREY = HexColor("F7F6F6");
  static Color RED = HexColor("CC0000");
  static Color TRANSPARENT = Colors.transparent;
  static Color BLACK = Colors.black;
  static Color WHITE = Colors.white;
  static Color BLUE = isdarktheme ? HexColor("226AD3") : Colors.teal;
  static Color TXT_LIGHT_TITLE = HexColor("373636");
  static Color TXT_LIGHT_SUB_TITLE = HexColor("707070");
  static Color SHADOW = Colors.black.withOpacity(0.1);
  static Color BORDER = HexColor("969DA5");
  static Color DARK_HINT_TEXT = HexColor("969DA5");
  static Color LIGHT_HINT_TEXT = Colors.black38;
  static Color SHIMMER_BASE = Colors.grey[300]!;
  static Color SHIMMER_HIGHLIGHT = Colors.grey[100]!;
  static Color FIELD_COLOR = HexColor("E1E1E1");
  static Color DARK_FIELD_COLOR = HexColor("B2B2B2");
  static Color GREEN = HexColor("34C600");
  static Color DARK_GRAY = HexColor("#A8A9AE");

  static Color LIGHT_GREY = HexColor("#A4AABF");
  static Color LOGIN_ICON_COLOR = HexColor("#8F96B0");




  static Color textfield_border_color = HexColor("#D7D9E2");
  static Color select_menu_color = HexColor("#226DD4");
  static Color unselect_menu_color = HexColor("#A4AABF");
  static Color line_color = HexColor("#EEEEEE");
  static Color card_border_color = HexColor("#E9E9E9");
  static Color upcoming_line_color = HexColor("#DCDCDC");
  static Color orange = HexColor("#D75F12");
  static Color yellow = HexColor("#F6C058");
  static Color appointment_border = HexColor("#AAAAAA");
  static Color light_blue = HexColor("#D2E5FF");
  static Color text_grey = HexColor("#B8B8B8");

  static Color btn_bordder = HexColor("#DFDFDF");
  static Color profile_txt_color = HexColor("#535353");
  static Color leave_his_icon_bg = HexColor("#E8F0FB");

  static Color approve_color = HexColor("#57D96D");
  static Color pending_color = HexColor("#F5BB4E");
  static Color date_bg_color = HexColor("#EBEEF5");


}