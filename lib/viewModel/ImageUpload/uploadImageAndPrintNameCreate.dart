import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/viewModel/ImageUpload/upload.dart';

uploadImageAndPrintNameCreate() async {
  if (img1 != immutableImg1)
    await upload(img1, pathGlobal1, 1).then((value) => productImg1 = value);
  if (img2 != immutableImg2)
    await upload(img2, pathGlobal2, 2).then((value) => productImg2 = value);
  if (img3 != immutableImg3)
    await upload(img3, pathGlobal3, 3).then((value) => productImg3 = value);
}
