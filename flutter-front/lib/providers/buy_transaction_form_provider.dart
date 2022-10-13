import 'package:flutter/cupertino.dart';

import '../models/buyProduct.dart';

class BuyTransactionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  BuyProduct transaction;

  BuyTransactionFormProvider(this.transaction);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
