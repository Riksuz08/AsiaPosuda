import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_bloc_mobile/src/core/utils/constants.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';

final getIt = GetIt.instance;

/// Create singletons (blocs and repositories) that can be shared across the app.
void registerSingletons() {
  getIt.registerLazySingleton<MainBloc>(() => MainBloc());
}

MainBloc get mainBloc => getIt.get<MainBloc>();

T inject<T extends Object>() {
  return getIt.get<T>();
}

T cubit<T extends Object>() {
  return AppConstants.navigatorKey.currentContext!.read<T>();
}
