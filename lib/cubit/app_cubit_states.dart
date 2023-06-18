import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialStates extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeStates extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingStates extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadStates extends CubitStates {
  LoadStates(this.places);
  final List<DataModel> places;

  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailStates extends CubitStates {
  DetailStates(this.places);
  final DataModel places;
  @override
  // Todo : implement props
  List<Object> get props => [places];
}
