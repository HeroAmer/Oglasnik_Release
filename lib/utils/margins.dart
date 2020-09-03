import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/cupertino.dart';

class Margin {
  EdgeInsets only(double top, bottom, right, left) => EdgeInsets.only(
      top: SizeConfig.blockSizeVertical * top,
      bottom: SizeConfig.blockSizeVertical * bottom,
      right: SizeConfig.blockSizeHorizontal * right,
      left: SizeConfig.blockSizeHorizontal * left);

  EdgeInsets symmetric(double vertical, horizontal) => EdgeInsets.symmetric(
      vertical: SizeConfig.blockSizeVertical * vertical,
      horizontal: SizeConfig.blockSizeHorizontal * horizontal);

  EdgeInsets all(double value) => EdgeInsets.all(value);
}
