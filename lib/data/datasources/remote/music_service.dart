import 'package:injectable/injectable.dart';
import 'package:fav_music_album/core/utils.dart';
import 'package:fav_music_album/data/model/album/get_album_tracks_response.dart';
import 'package:fav_music_album/data/model/artist/artist_search_response.dart';
import 'package:fav_music_album/data/model/artist/get_top_albums_response.dart';

import 'package:fav_music_album/domin/usecases/artists/search_for_artist.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'music_service.g.dart';

@LazySingleton()
@RestApi(
  baseUrl: AppConst.kApiEndPoint,
)
abstract class MusicService {
  @factoryMethod
  factory MusicService(Dio dio) = _MusicService;

  @GET('')
  Future<HttpResponse<ArtistSearchResponse>> searchForArtist(
      @Query('artist') String artist,
      {@Query('api_key') String apiKey = AppConst.kApiKey,
      @Query('format') String format = 'json',
      @Query('method') String method = 'artist.search'});

  @GET('')
  Future<HttpResponse<GetTopAlbumsResponse>> getTopAlbums(
      @Query('mbid') String mbid,
      {@Query('api_key') String apiKey = AppConst.kApiKey,
      @Query('format') String format = 'json',
      @Query('method') String method = 'artist.gettopalbums'});
  @GET('')
  Future<HttpResponse<GetAlbumTracksResponse>> getAlbumTracks(
      @Query('mbid') String mbid, @Query('artist') String artist,
      {@Query('api_key') String apiKey = AppConst.kApiKey,
      @Query('format') String format = 'json',
      @Query('method') String method = 'album.getinfo'});
}
