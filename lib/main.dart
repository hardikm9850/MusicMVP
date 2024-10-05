import 'dart:io';

import 'package:fav_music_album/presentation/blocs/favorite_albums/bloc/favorite_albums_bloc.dart';
import 'package:fav_music_album/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/routes/routes.dart';
import 'core/utils.dart';
import 'data/model/album/get_album_tracks_response.dart';
import 'data/model/artist/artist_search_response.dart';
import 'data/model/artist/get_top_albums_response.dart';
import 'generated/codegen_loader.g.dart';
import 'injection.dart';

void main() async {
  configureDependencies(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  Directory? dir = await getTemporaryDirectory();

  Hive.init(dir.path);
  Hive.registerAdapter<AlbumModel>(AlbumModelAdapter());
  Hive.registerAdapter<ArtistModel>(ArtistModelAdapter());
  Hive.registerAdapter<TrackModel>(TrackModelAdapter());

  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      assetLoader: const CodegenLoader(),
      path: './assets/translations/',
      fallbackLocale: AppConst.kSupportedLocals.first,
      supportedLocales: AppConst.kSupportedLocals,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<FavoriteAlbumsBloc>.value(value: getIt.get())],
        child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: AppConst.kMaterialAppTitle,
            theme: AppConst.getAppTheme(),
            initialRoute: Routes.kHomePageRoute,
            home: HomePage(),
            routes: Routes.getRoutes()
            )
    );
  }
}
