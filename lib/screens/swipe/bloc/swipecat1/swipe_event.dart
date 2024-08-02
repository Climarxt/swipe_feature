part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SwipeFetchPostsCat1Man extends SwipeEvent {}

class SwipeFetchPostsCat1Woman extends SwipeEvent {}