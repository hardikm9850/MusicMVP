import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:fav_music_album/core/resource/resource.dart';
import 'package:fav_music_album/core/usecase/usecase.dart';
import 'package:fav_music_album/domin/repositories/albums_repository.dart';

@LazySingleton()
class GetFavoriteAlbums extends NonParametersUseCase<Resource> {
  AlbumsRepository albumsRepository;
  GetFavoriteAlbums(this.albumsRepository);
  @override
  Future<Resource> call() async {
    return await albumsRepository.getFavoritesAlbums();
  }
}
