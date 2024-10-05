import 'package:injectable/injectable.dart';
import 'package:fav_music_album/core/resource/resource.dart';
import 'package:fav_music_album/core/usecase/usecase.dart';
import 'package:fav_music_album/domin/entities/album.dart';
import 'package:fav_music_album/domin/repositories/albums_repository.dart';

@LazySingleton()
class DeleteAlbumFromFavoriteList extends UseCase<Resource, Album> {
  AlbumsRepository albumsRepository;
  DeleteAlbumFromFavoriteList(this.albumsRepository);
  @override
  Future<Resource> call({Album? params}) {
    return albumsRepository.deleteAlbum(params!);
  }
}
