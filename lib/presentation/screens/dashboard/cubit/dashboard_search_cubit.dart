import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardSearchCubit extends Cubit<String> {
  DashboardSearchCubit() : super("");

  void updateText(String value) => emit(value);
}