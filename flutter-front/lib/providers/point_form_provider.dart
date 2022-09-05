import 'package:app_uteam/models/points.dart';
import 'package:flutter/material.dart';

class PointFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Point point;

  PointFormProvider(this.point);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
