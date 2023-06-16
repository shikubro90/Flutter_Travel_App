import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit_states.dart';
import 'package:flutter_travel_app/cubit/app_cubits.dart';
import 'package:flutter_travel_app/pages/home_page.dart';
import '../pages/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state){
          if(state is WelcomeStates){
            return WelcomePage();
          }if(state is LoadingStates){
            return const Center(child: CircularProgressIndicator());
          }if(state is LoadStates){
            return HomePage();
          } else{
            return Container();
          }
        },
      )
    );
  }
}
