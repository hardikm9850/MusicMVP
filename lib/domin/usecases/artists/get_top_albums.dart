import 'package:injectable/injectable.dart';
import 'package:fav_music_album/core/resource/resource.dart';
import 'package:fav_music_album/core/usecase/usecase.dart';
import 'package:fav_music_album/domin/entities/album.dart';
import 'package:fav_music_album/domin/entities/artist.dart';
import 'package:fav_music_album/domin/repositories/artist_repository.dart';

@LazySingleton()
class GetTopAlbums extends UseCase<Resource, Artist> {
  ArtistRepository artistRepository;
  GetTopAlbums(this.artistRepository);
  @override
  Future<Resource> call({Artist? params}) {
    return artistRepository.getTopAlbums(params!);
  }
}
