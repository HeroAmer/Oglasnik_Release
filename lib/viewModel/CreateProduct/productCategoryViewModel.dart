import 'package:Oglasnik/utils/shared/globalVariables.dart';

Set<Set> categoryListValue(String productCategoryList) {
    return {
                                        if (createSwitcher)
                                          {
                                            dropdownValueCategory =
                                                productCategoryList,
                                            dropdownValueBrand =
                                                categoryBrands[
                                                    dropdownValueCategory][0],
                                          }
                                        else
                                          {
                                            updateDropdownValueCategory =
                                                productCategoryList,
                                            updateDropdownValueBrand =
                                                categoryBrands[
                                                    updateDropdownValueCategory][0],
                                          }
                                      };
  }