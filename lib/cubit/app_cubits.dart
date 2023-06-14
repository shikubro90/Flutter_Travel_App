import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit_states.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit(): super(InitialStates()){
    emit(WelcomeStates());
  }

  

}