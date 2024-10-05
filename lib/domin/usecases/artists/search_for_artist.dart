import 'package:injectable/injectable.dart';
import 'package:fav_music_album/core/resource/resource.dart';
import 'package:fav_music_album/core/usecase/usecase.dart';
import 'package:fav_music_album/domin/entities/artist.dart';
import 'package:fav_music_album/domin/repositories/artist_repository.dart';
import 'package:fav_music_album/domin/usecases/artists/search_for_artist_params.dart';

@LazySingleton()
class SearchForArtist implements UseCase<Resource, SearchForArtistParams> {
  SearchForArtist(this.repository);
  ArtistRepository repository;
  @override
  Future<Resource> call({SearchForArtistParams? params}) async {
    return repository.searchForArtist(params!);
  }
}
