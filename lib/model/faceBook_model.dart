// {
// "name": "Open Graph Test User",
// "email": "open_jygexjs_user@tfbnw.net",
// "picture": {
// "data": {
// "height": 126,
// "url": "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/8462.jpg",
// "width": 200
// }
// },
// "id": "136742241592917"
// }


class FaceBookModel{

  final String ? name;
  final String ? email;
  final String ? id;
  final FaceBookPhotoModel ? faceBookPhotoModel;

  FaceBookModel({this.faceBookPhotoModel, this.name, this.email, this.id});

  factory FaceBookModel.fromJson(Map<String , dynamic> json)=>
      FaceBookModel(
        name: json['name'],
        email: json['email'],
        id: json['id'],
        faceBookPhotoModel:FaceBookPhotoModel.fromJson(json['picture']['data'])
      );


}

class FaceBookPhotoModel{
  final String ? url ;
  final int ? height;
  final int ? width;

  FaceBookPhotoModel({this.url, this.height, this.width});

  factory FaceBookPhotoModel.fromJson(Map<String , dynamic> json) =>
      FaceBookPhotoModel(
        url : json['url'],
        height : json['height'],
        width : json['width'],

      );
}