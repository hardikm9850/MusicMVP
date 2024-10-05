import 'package:injectable/injectable.dart';
import 'package:fav_music_album/core/resource/http_response_handler.dart';
import 'package:fav_music_album/data/datasources/local/app_database.dart';
import 'package:fav_music_album/data/datasources/remote/music_service.dart';
import 'package:fav_music_album/data/model/album/get_album_tracks_response.dart';
import 'package:fav_music_album/domin/entities/album.dart';
import 'package:fav_music_album/core/resource/resource.dart';
import 'package:fav_music_album/domin/repositories/albums_repository.dart';
import 'package:fav_music_album/data/model/artist/get_top_albums_response.dart';

@LazySingleton(as: AlbumsRepository)
class AlbumsRepositoryImpl implements AlbumsRepository {
  AppDataBase appDataBase;
  MusicService musicService;
  AlbumsRepositoryImpl(this.appDataBase, this.musicService);
  @override
  Future<Resource> deleteAlbum(Album album) async {
    try {
      await appDataBase.deleteAlbum(album as AlbumModel);

      return const SuccessResource(true);
    } catch (e) {
      return FailedResource(e);
    }
  }

  @override
  Future<Resource> getFavoritesAlbums() async {
    try {
      return SuccessResource(await appDataBase.getFavoritesAlbums());
    } catch (e) {
      return FailedResource(e);
    }
  }

  @override
  Future<Resource> saveAlbum(Album album) async {
    try {
      await appDataBase.saveAlbum(album as AlbumModel);

      return const SuccessResource(true);
    } catch (e) {
      try {
        await deleteAlbum(album);
      } catch (e) {
        return FailedResource(e);
      }
      return FailedResource(e);
    }
  }

  @override
  Future<Resource> getAlbumTracks(Album album) async {
    Resource resource = await HttpResponseHandler<GetAlbumTracksResponse>()
        .handle(musicService.getAlbumTracks(
            album.mbid ?? '', album.artist?.mbid ?? ''));
    if (resource is SuccessResource<GetAlbumTracksResponse>) {
      album.tracks = resource.data.album?.tracks?.track ?? [];
      if (album.isFavorite ?? false) {
        await appDataBase.addTracks(
            album.tracks as List<TrackModel>, album as AlbumModel);
      }

      return SuccessResource<Album>(album);
    } else {
      return SuccessResource<Album>(album);
    }
  }
}
