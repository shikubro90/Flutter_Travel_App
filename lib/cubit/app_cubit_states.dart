import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_travel_app/model/data_model.dart';

abstract class CubitStates extends Equatable{}

class InitialStates extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WelcomeStates extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoadingStates extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadStates extends CubitStates{

  final List<DataModel> places;

  LoadStates({Key? key, required this.places});


  @override
  // TODO: implement props
  List<Object> get props => [places];
}
