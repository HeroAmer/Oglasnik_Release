import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';

deleteFirstEntry() {
  if (createSwitcher) {
    if (img2 != immutableImg2 && img3 != immutableImg3) {
      img1 = img2;
      pathGlobal1 = pathGlobal2;
      img2 = img3;
      pathGlobal2 = pathGlobal3;
      img3 = immutableImg3;
      pathGlobal3 = null;
    } else if (img2 != immutableImg2) {
      img1 = img2;
      pathGlobal1 = pathGlobal2;
      img2 = immutableImg2;
      pathGlobal2 = null;
    } else {
      img1 = immutableImg1;
      pathGlobal1 = null;
    }
  } else {
    if ((img2 != immutableImg2 || image2Name != null) &&
        (img3 != immutableImg3 || image3Name != null)) {
      if (img1 != immutableImg1) {
        if (img2 != immutableImg2) {
          img1 = img2;
          pathGlobal1 = pathGlobal2;
          productImg1Update = productImg2Update;
        } else {
          image1Name = image2Name;
          productImg1Update = productImg2Update;
        }

        if (img3 != immutableImg3) {
          img2 = img3;
          pathGlobal2 = pathGlobal3;
          img3 = immutableImg3;
          productImg2Update = productImg3Update;
          productImg3Update = null;
        } else {
          image2Name = image3Name;
          image3Name = null;
          productImg2Update = productImg3Update;
          productImg3Update = null;
        }
      } else {
        if (img2 != immutableImg2) {
          img1 = img2;
          pathGlobal1 = pathGlobal2;
          productImg1Update = productImg2Update;
        } else {
          image1Name = image2Name;
          productImg1Update = productImg2Update;
        }

        if (img3 != immutableImg3) {
          img2 = img3;
          pathGlobal2 = pathGlobal3;
          img3 = immutableImg3;
          productImg2Update = productImg3Update;
          productImg3Update = null;
        } else {
          image2Name = image3Name;
          image3Name = null;
          productImg2Update = productImg3Update;
          productImg3Update = null;
        }
      }
    } else if (img2 != immutableImg2 || image2Name != null) {
      if (img2 != immutableImg2) {
        img1 = img2;
        img2 = immutableImg2;
        pathGlobal1 = pathGlobal2;
        pathGlobal2 = null;
        productImg1Update = productImg2Update;
        productImg2Update = null;
      } else {
        if (img1 != immutableImg1) {
          img1 = immutableImg1;
          image1Name = image2Name;
          image2Name = null;
          productImg1Update = productImg2Update;
          productImg2Update = null;
        } else {
          image1Name = image2Name;
          image2Name = null;
          productImg1Update = productImg2Update;
          productImg2Update = null;
        }
      }
    } else {
      img1 != immutableImg1 ? img1 = immutableImg1 : image1Name = null;
      productImg1Update = null;
    }
  }
}
