
import 'package:flutter/material.dart';

import '../models/registration_model.dart';

class RegistrationProvider extends ChangeNotifier{
  Registration? registration;
  updateRegistration({Registration? newRegistration}){
    registration=newRegistration;
    notifyListeners();
  }
}