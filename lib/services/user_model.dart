
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? name;
  String? email;
  String? uid;
  String? avatar;
  List<MediaModel> media = [];
  UserModel({this.name,this.email,this.uid,this.avatar,this.media = const []});
  toJson() {
    return {
      'name': name,
      'email':email,
      'uid':uid,
      'avatar':avatar,
      'media' : media
    };
  }

  factory UserModel.fromJson(Map<String,dynamic> data){
    List<dynamic> list = data['media'];
    List<MediaModel> temp = [];
    for (var i in list){
      temp.add(MediaModel.fromJson(i));
    }
    return UserModel(
      name: data['name'],
      email : data['email'],
        uid:data['uid'],
      avatar: data['avatar'],

      media:temp,
    );
  }
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    List<dynamic> list = data['media'];
    List<MediaModel> temp = [];
    for (var i in list){
      temp.add(MediaModel.fromJson(i));
    }
    return UserModel(
        name: data['name'],
        email : data['email'],
      uid : data["uid"],
      avatar: data['avatar'],
      media: temp,
    );
  }
}

class MediaModel{
  String? name;
  String? filePath;
  MediaModel({this.name,this.filePath});
  toJson() {
    return {
      'name': name,
      'filePath':filePath
    };
  }

  factory MediaModel.fromJson(Map<String,dynamic> data){

    return MediaModel(
      name: data['name'],
      filePath: data['filePath']
    );
  }

}