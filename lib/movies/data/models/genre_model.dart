import '../../domain/entities/genre.dart';

class GenreModel extends Genre{
  GenreModel(super.id, super.name);

  factory GenreModel.fromJson( Map json){
    return GenreModel(
        json["id"] , json["name"] );
  }

}