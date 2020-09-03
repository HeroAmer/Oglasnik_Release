import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageFiveSubmit.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/priceTextField.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageOneUploadButton.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageThreeUploadButton.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageTwoUploadButton.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/viewModel/ImageUpload/deleteFirstEntry.dart';
import 'package:Oglasnik/viewModel/ImageUpload/deleteSecondEntry.dart';
import 'package:Oglasnik/viewModel/ImageUpload/deleteThirdEntry.dart';
import 'package:flutter/cupertino.dart';

class ImagePageWidget extends StatefulWidget {
  const ImagePageWidget({
    Key key,
    @required this.bottom,
    @required this.onFlatButtonPressed,
    @required this.editProduct,
    @required this.productSnapshot,
  }) : super(key: key);

  final double bottom;
  final VoidCallback onFlatButtonPressed;
  final String editProduct;
  final Product productSnapshot;
  @override
  _ImagePageWidgetState createState() => _ImagePageWidgetState();
}

class _ImagePageWidgetState extends State<ImagePageWidget> {
  @override
  initState() {
    super.initState();
  }

  refresh() {
    setState(() {});
  }

  String _path1, _path2, _path3;
  String _fileName1, _fileName2, _fileName3;
  FileType _imageType = FileType.image;

  bool loading = false;

  void openFileExplorer1() async {
    _path1 = await FilePicker.getFilePath(type: _imageType);
    _fileName1 = _path1.split('/').last;

    setState(() {
      img1 = _fileName1;
      pathGlobal1 = _path1;
    });
  }

  void openFileExplorer2() async {
    _path2 = await FilePicker.getFilePath(type: _imageType);
    _fileName2 = _path2.split('/').last;
    setState(() {
      img2 = _fileName2;
      pathGlobal2 = _path2;
    });
  }

  void openFileExplorer3() async {
    _path3 = await FilePicker.getFilePath(type: _imageType);
    _fileName3 = _path3.split('/').last;
    setState(() {
      img3 = _fileName3;
      pathGlobal3 = _path3;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return loadingGlob
        ? Loading()
        : imageUploadContainer(
            context, refresh, widget.editProduct, widget.onFlatButtonPressed);
  }

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
          imageOneUploadButton(openFileExplorer1, deleteFirstEntry, refresh),
          imageTwoUploadButton(openFileExplorer2, deleteSecondEntry, refresh),
          imageThreeUploadButton(openFileExplorer3, deleteThirdEntry, refresh),
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
            child: pageViewSubmitButton(
              context,
              onFlatButtonPressed,
              refresh,
            ),
          ),
        ],
      ),
    );
  }
}
