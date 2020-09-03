import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/ImageUpload/createProductPressed.dart';
import 'package:Oglasnik/viewModel/ImageUpload/resetGlobalVariables.dart';
import 'package:Oglasnik/viewModel/ImageUpload/updateProductPressed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

SizedBox pageViewSubmitButton(BuildContext context,
    VoidCallback onFlatButtonPressed, VoidCallback refresh) {
  if (!createSwitcher) {
    return button("Završi", () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      await InternetConnectivity().checkForConnectivity();
      if (hasActiveConnection == true) {
        if (pageController.page == 4) {
          if (productPriceFormKey.currentState.validate()) {
            onFlatButtonPressed();
            azurload = true;
            loadingGlob = true;
            refresh();
            await updateProductPressed(context);
            resetGlobalVariables();
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushAndRemoveUntil(
                  FadeRoute(page: RegisteredHome()),
                  (Route<dynamic> route) => false);
            });
          } else
            return null;
        }
      } else
        displayInternetDialog(context);
    });
  } else {
    return button("Završi", () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      await InternetConnectivity().checkForConnectivity();

      if (hasActiveConnection) {
        if (pageController.page == 4) {
          if (productPriceFormKey.currentState.validate()) {
            onFlatButtonPressed();
            azurload = false;
            loadingGlob = true;
            createdGlob = true;
            refresh();
            await createProductPressed(context);
            resetGlobalVariables();
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushAndRemoveUntil(
                  FadeRoute(page: RegisteredHome()),
                  (Route<dynamic> route) => false);
            });
          } else
            return null;
        }
      } else
        displayInternetDialog(context);
    });
  }
}
