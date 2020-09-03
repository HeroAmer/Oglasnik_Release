import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';

class PageViewButton extends StatelessWidget {
  const PageViewButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: Margin().only(0, 5, 0, 0),
      child: button("Dalje", () async {
        allowAutoValidate = true;
        if (pageController.page == 3) {
          if (productDescFormKey.currentState.validate()) {
            CreateProduct().proceedToNextPage(context);
          } else
            return null;
        } else if (pageController.page == 2) {
          if (productTagFormKey.currentState.validate()) {
            CreateProduct().proceedToNextPage(context);
          } else
            return null;
        } else if (pageController.page == 1) {
          CreateProduct().proceedToNextPage(context);
          return null;
        } else if (pageController.page == 0) {
          if (productNameFormKey.currentState.validate()) {
            CreateProduct().proceedToNextPage(context);
          } else
            return null;
        }
      }),
    );
  }
}
