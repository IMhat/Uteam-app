import 'package:app_uteam/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Transaction transaction;

  TransactionFormProvider(this.transaction);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
