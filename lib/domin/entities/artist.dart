import 'package:hive/hive.dart';
import 'package:fav_music_album/data/model/artist/artist_search_response.dart';

abstract class Artist extends HiveObject {
  String? name;
  String? listeners;
  String? mbid;

  String? url;

  String? streamable;
}
