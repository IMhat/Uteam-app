import 'package:app_uteam/models/product.dart';
import 'package:flutter/material.dart';

import '../models/wallet.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product product;
  Wallet wallet;

  ProductFormProvider(this.product, this.wallet);
  


  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
