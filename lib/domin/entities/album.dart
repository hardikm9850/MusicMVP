import 'package:equatable/equatable.dart';
import 'package:fav_music_album/domin/entities/artist.dart';
import 'package:fav_music_album/domin/entities/track.dart';

abstract class Album implements Equatable {
  String? name;
  int? playcount;
  String? mbid;
  String? url;
  Artist? artist;
  String? albumImage;
  @override
  List<Object?> get props => [mbid];
  @override
  bool? get stringify => true;
  bool? isFavorite;
  List<Track>? tracks;
}
