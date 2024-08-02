// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:new_feature/blocs/blocs.dart';
import 'package:new_feature/config/configs.dart';
import 'package:new_feature/models/models.dart';
import 'package:new_feature/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final SwipeRepository _swipeRepository;
  final AuthBloc _authBloc;
  final ContextualLogger logger;

  SwipeBloc({
    required SwipeRepository swipeRepository,
    required AuthBloc authBloc,
  })  : _swipeRepository = swipeRepository,
        _authBloc = authBloc,
        logger = ContextualLogger('SwipeBloc'),
        super(const SwipeState.initial()) {
    on<SwipeFetchPostsCat1Man>(_onSwipeFetchPostsCat1Man);
  }

  Future<void> _onSwipeFetchPostsCat1Man(
    SwipeFetchPostsCat1Man event,
    Emitter<SwipeState> emit,
  ) async {
    const String functionName = '_onSwipeFetchPostsCat1Man';
    logger.logInfo(functionName, 'Début de la récupération des posts');
    try {
      final userId = '1ktzeQosrEOWFhKjKW5tMGXbfy22';
      final posts = await _swipeRepository.getSwipeMan(userId: userId);
      logger.logInfo(functionName, 'Posts récupérés avec succès', {
        'userId': userId,
        'postsCount': posts.length,
      });
      emit(SwipeState.loaded(posts));
    } catch (e) {
      logger
          .logError(functionName, 'Erreur lors du chargement des posts', {
        'error': e.toString(),
      });
      emit(SwipeState.error(
          'SwipeFetchPostsCat1Man : Erreur lors du chargement des posts: ${e.toString()}'));
    }
  }
}
