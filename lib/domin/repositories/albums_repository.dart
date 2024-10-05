import 'package:fav_music_album/core/resource/resource.dart';
import 'package:fav_music_album/domin/entities/album.dart';

abstract class AlbumsRepository {
  Future<Resource> getAlbumTracks(Album album);

  Future<Resource> getFavoritesAlbums();

  Future<Resource> saveAlbum(Album album);
  Future<Resource> deleteAlbum(Album album);
  // Future<Resource> isFavorite(Album album);
}
