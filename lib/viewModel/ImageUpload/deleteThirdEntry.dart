import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';

deleteThirdEntry() {
  if (createSwitcher) {
    img3 = immutableImg3;
    pathGlobal3 = null;
  } else {
    if (img3 != immutableImg3) {
      img3 = immutableImg3;
      productImg3Update = null;
    } else {
      image3Name = null;
      productImg3Update = null;
    }
  }
}
