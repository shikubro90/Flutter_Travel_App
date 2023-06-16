import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit_states.dart';
import 'package:flutter_travel_app/services/data_services.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitialStates()) {
    emit(WelcomeStates());
  }
  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;

  void getData() async {
    try {
      emit(LoadingStates());
      places = await data.getInfo();
      // print("load place${places}");
      emit(LoadStates(places: places));
    } catch (e) {
      print(e);
    }
  }
}
