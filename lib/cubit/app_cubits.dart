import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit_states.dart';
import 'package:flutter_travel_app/model/data_model.dart';
import 'package:flutter_travel_app/services/data_services.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitialStates()) {
    emit(WelcomeStates());
  }
  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;

  // void getData() async {
  //   try {
  //     emit(LoadingStates());
  //     places = await data.getInfo();
  //     if (places != null) {
  //       print("load place ${await places}");
  //       emit(LoadStates(await places));
  //     } else {
  //       print("places is null or not initialized.");
  //     }
  //     // emit(LoadStates(places));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void getData() async {
  //   try {
  //     emit(LoadingStates());
  //     places = await data.getInfo();
  //     if (places != null) {
  //       print("load place $places");
  //       emit(LoadStates(places));
  //     } else {
  //       print("places is null or not initialized.");
  //     }
  //   } catch (e) {
  //     print("An error occurred: $e");
  //   }
  // }

  void getData() async {
    try {
      emit(LoadingStates());
      places = await data.getInfo();
      emit(LoadStates(places));
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  goToDetailPage(DataModel data){
    emit(DetailStates(data));
  }

  goBack(){
  emit(LoadStates(places));  
  }

}
