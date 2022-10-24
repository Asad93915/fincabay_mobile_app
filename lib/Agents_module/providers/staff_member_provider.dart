
import 'package:flutter/cupertino.dart';

import '../models/get_all_staff_member_model.dart';

class GetStaffProvider extends ChangeNotifier{
  List<StaffMember>? staff=[];
  updateStafMember({List<StaffMember>? newStaff}){
    staff=newStaff;
    notifyListeners();
  }
}