import 'package:bloc/bloc.dart';
import '../../../../core/resource/resource.dart';
import '../../../../core/state/state_types.dart';
import '../../../../domin/entities/album.dart';
import '../../../../domin/entities/artist.dart';
import '../../../../domin/usecases/artists/get_top_albums.dart';

part 'top_albums_event.dart';
part 'top_albums_state.dart';

class TopAlbumsBloc extends Bloc<TopAlbumsEvent, TopAlbumsState> {
  GetTopAlbums getTopAlbums;
  TopAlbumsBloc(this.getTopAlbums) : super(TopAlbumsInitial()) {
    on<TopAlbumsEvent>((event, emit) async {
      if (event is TopAlbumsGetEvent) {
        if (event.withLoading) emit(TopAlbumsLoadingState());
        Resource resource = await getTopAlbums.call(params: event.artist);
        if (resource is SuccessResource<List<Album>>) {
          emit(TopAlbumsSuccessState(resource));
        } else {
          emit(TopAlbumsFailedState(resource as FailedResource));
        }
      }
    });
  }
  void getTopAlbumsEvent(Artist artist, {bool withLoading = true}) {
    add(TopAlbumsGetEvent(artist, withLoading: withLoading));
  }
}
