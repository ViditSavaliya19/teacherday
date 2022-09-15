import 'package:flutter/cupertino.dart';
import 'package:teacherday/screens/dash/model/studentModel.dart';

class DashProvider extends ChangeNotifier
{
    List<StudentModel> l1 =[];


    void addData(StudentModel s1)
    {
      l1.add(s1);
      notifyListeners();
    }

    void remove(int index)
    {
      l1.removeAt(index);
      notifyListeners();
    }
}
