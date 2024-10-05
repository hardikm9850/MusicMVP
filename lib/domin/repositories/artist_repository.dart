import 'package:fav_music_album/core/resource/resource.dart';
import 'package:fav_music_album/domin/entities/artist.dart';
import 'package:fav_music_album/domin/usecases/artists/search_for_artist_params.dart';

abstract class ArtistRepository {
  Future<Resource> searchForArtist(SearchForArtistParams params);
  Future<Resource> getTopAlbums(Artist artist);
}
