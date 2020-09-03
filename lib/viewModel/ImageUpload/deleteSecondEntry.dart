import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';

deleteSecondEntry() {
  if (createSwitcher) {
    if (img3 != immutableImg3) {
      img2 = img3;
      pathGlobal2 = pathGlobal3;
      img3 = immutableImg3;
      pathGlobal3 = null;
    } else {
      img2 = immutableImg2;
      pathGlobal2 = null;
    }
  } else {
    if (img3 != immutableImg3 || image3Name != null) {
      if (img3 != immutableImg3) {
        img2 = img3;
        pathGlobal2 = pathGlobal3;
        pathGlobal3 = null;
        img3 = immutableImg3;
        productImg2Update = productImg3Update;
        productImg3Update = null;
      } else {
        if (img2 != immutableImg2) {
          img2 = immutableImg2;
          image2Name = image3Name;
          image3Name = null;
          productImg2Update = productImg3Update;
          productImg3Update = null;
        } else {
          image2Name = image3Name;
          image3Name = null;
          productImg2Update = productImg3Update;
          productImg3Update = null;
        }
      }
    } else {
      img2 != immutableImg2 ? img2 = immutableImg2 : image2Name = null;
      productImg2Update = null;
    }
  }
}
