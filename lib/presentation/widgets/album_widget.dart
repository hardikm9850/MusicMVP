import 'package:flutter/material.dart';
import 'package:fav_music_album/core/utils.dart';
import 'package:fav_music_album/domin/entities/album.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fav_music_album/resources/resources.dart';

class AlbumsWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  AlbumsWidget(this.album, {this.onClick, this.onFavoriteClick, Key? key})
      : super(key: key);
  final Album album;
  Function? onClick;
  Function? onFavoriteClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Card(
        color: Colors.black,
        child: Stack(
          children: [
            Container(
              child: CachedNetworkImage(
                imageUrl: album.albumImage ?? '',
                placeholder: (context, url) => Image.asset(Images.star),
                errorWidget: (context, url, error) => Image.asset(Images.star),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FavoriteButton(
                isFavorite: album.isFavorite,
                iconColor: AppConst.kAppSecondaryColor,
                valueChanged: (_isFavorite) {
                  onFavoriteClick?.call(_isFavorite);
                  print('Is Favorite $_isFavorite)');
                },
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    album.name ?? '',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
