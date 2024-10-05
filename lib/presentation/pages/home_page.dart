import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/routes/routes.dart';
import '../../core/utils.dart';
import '../../domin/entities/album.dart';
import '../../generated/app_text.dart';
import '../blocs/favorite_albums/bloc/favorite_albums_bloc.dart';
import '../widgets/album_widget.dart';
import '../widgets/appbar_search_button.dart';
import '../widgets/state_widget.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<FavoriteAlbumsBloc>(context).getAllFavAlbums();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(AppConst.kMaterialAppTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith()),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          AppbarSearchButton(
            onClick: () async {
              await Navigator.of(context).pushNamed(Routes.kSearchPageRoute);
              //BlocProvider.of<FavoriteAlbumsBloc>(context).getAllFavAlbums();
            },
          )
        ],
      ),
      body: Container(
        child: BlocBuilder<FavoriteAlbumsBloc, FavoriteAlbumsState>(
          builder: (contest, state) {
            return AppStateWidget(
                builder: (state, context) {
                  if (state is FavoriteAlbumsSuccessState) {
                    if (state.albums.isEmpty) {
                      return Center(
                          child: Text(
                              tr(
                                'home.no_albums_added',
                              ),
                              style: Theme.of(context).textTheme.headlineMedium));
                    } else {
                      return _buildBody(state.albums);
                    }
                  }
                },
                state: state);
          },
        ),
      ),
    );
  }

  Widget _buildBody(List<Album> albums) {
    return GridView.count(
      crossAxisCount: 2,
      children: albums
          .map((e) => AlbumsWidget(
                e,
                onClick: () {
                  Navigator.pushNamed(context, Routes.kAlbumDetailsPage,
                      arguments: e);
                },
                onFavoriteClick: (_isFav) {
                  if (_isFav) {
                    BlocProvider.of<FavoriteAlbumsBloc>(context).addAlbum(e);
                  } else {
                    BlocProvider.of<FavoriteAlbumsBloc>(context).deleteAlbum(e);
                  }
                },
                key: ValueKey('${e.mbid}${e.isFavorite.toString()}'),
              ))
          .toList(),
    );
  }
}
