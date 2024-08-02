import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_feature/blocs/blocs.dart';
import 'package:new_feature/config/configs.dart';
import 'package:new_feature/repositories/repositories.dart';
import 'package:new_feature/screens/swipe/bloc/swipecat1/swipe_bloc.dart';

class BlocProviderConfig {
  static MultiBlocProvider getSwipeMultiBlocProvider(
      BuildContext context, Widget child) {
    final ContextualLogger logger =
        ContextualLogger('BlocProviderConfig.getSwipeMultiBlocProvider');

    return MultiBlocProvider(
      providers: [
        BlocProvider<SwipeBloc>(
          create: (context) {
            final swipeBloc = SwipeBloc(
              swipeRepository: context.read<SwipeRepository>(),
              authBloc: context.read<AuthBloc>(),
            );
            logger.logInfo('SwipeBloc.create', 'Initialized SwipeBloc', {
              'swipeRepository': context.read<SwipeRepository>().toString(),
              'authBloc': context.read<AuthBloc>().toString(),
            });
            return swipeBloc;
          },
        ),
      ],
      child: child,
    );
  }
}
