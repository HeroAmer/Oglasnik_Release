/*


import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/priceTextField.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageOneUploadButton.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageThreeUploadButton.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageTwoUploadButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageFiveSubmit.dart';
import 'package:Oglasnik/viewModel/ImageUpload/deleteFirstEntry.dart';
import 'package:Oglasnik/viewModel/ImageUpload/deleteSecondEntry.dart';
import 'package:Oglasnik/viewModel/ImageUpload/deleteThirdEntry.dart';
import 'package:Oglasnik/viewModel/ImageUpload/openFileExplorer1.dart';
import 'package:Oglasnik/viewModel/ImageUpload/openFileExplorer2.dart';
import 'package:Oglasnik/viewModel/ImageUpload/openFileExplorer3.dart';
import 'package:flutter/cupertino.dart';

Container imageUploadContainer(BuildContext context, Function refresh,
    String editProduct, VoidCallback onFlatButtonPressed) {
  return Container(
    child: Column(
      children: <Widget>[
        MainTitle(
          editProduct: editProduct,
        ),
        Container(
          margin: Margin().only(0, 16, 0, 0),
        ),
        imageOneUploadButton(openFileExplorer1, deleteFirstEntry),
        imageTwoUploadButton(openFileExplorer2, deleteSecondEntry),
        imageThreeUploadButton(openFileExplorer3, deleteThirdEntry),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: Margin().only(3, 3, 0, 12), child: priceTextField()),
            Padding(
              padding: EdgeInsets.only(left: 7, bottom: 5),
              child: Text(
                MoneyText().kmText,
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 8,
        ),
        Container(
          margin: Margin().only(0, 1, 0, 0),
          child: PageFiveSubmit(
            context: context,
            onFlatButtonPressed: onFlatButtonPressed,
          ),
        ),
      ],
    ),
  );
}
*/
