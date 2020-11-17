import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxio/MapListingBloc/MapListingEvent.dart';
import 'package:taxio/MapListingBloc/MapListingState.dart';
import 'package:taxio/Repository/repository.dart';

class MapListingBloc extends Bloc<MapListingEvent, MapListingState> {
  MapListingBloc() : super(MapListingInitial());
  Repository repository = Repository();

  @override
  Stream<MapListingState> mapEventToState(
    MapListingEvent event,
  ) async* {
    if (event is MapList) {
      await repository.map();
    }
  }
}
