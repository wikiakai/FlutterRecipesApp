import 'package:flutertuts_exam/API/api.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<String> allSpices = [];
  bool isLoading = false;
  final apiServices = ApiServices();

  void init() {
    getSpices();
  }

  Future getSpices() async {
    try {
      isLoading = true;
      notifyListeners();

      allSpices = await apiServices.getSpices();

      isLoading = false;
      notifyListeners();

      return allSpices;
    } catch (e) {
      print(e.toString());
    }
  }

  bool iconPress = false;
  iconPressed() {}
}
