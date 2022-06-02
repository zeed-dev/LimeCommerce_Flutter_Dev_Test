import 'package:mini_apps/viewModel/base_view_model.dart';

class CategoriesViewModel extends BaseViewModel {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndexChange(int selectedIndex) {
    _selectedIndex = selectedIndex;
    notifyListeners();
  }
}
