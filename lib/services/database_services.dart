import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ur_fine/services/user_model.dart';

class DatabaseServices {
  final users = FirebaseFirestore.instance.collection("users");
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<(int statusCode, String? uid)> createUser(String name, String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        return (404,null);
      } else {

          await users.doc(credential.user?.uid).get().then((docSnapshot) {
            // check if already exist or not
            if (!docSnapshot.exists) {
              users.doc(credential.user?.uid).set(UserModel(
                uid: credential.user?.uid,
                name: name,
                email:email,
              ).toJson());
            }
          });
          String? uid = credential.user?.uid;

        return (200,uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        return (401,null);
      } else if (e.code == 'email-already-in-use') {
        return (409,null);
      }
    } catch (e) {
      debugPrint(e.toString());
      return (404,null);
    }
    return (404,null);
  }

  Future<(int statusCode, String? uid)> checkIfUserExists(String userEmail,String userPassword) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail,
          password: userPassword
      );
      String? uid = credential.user?.uid;
      return ( 200, uid);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
        return (404,null);

    }
  }

 Future<UserModel> getCurrentUser(String uid) async {
   final snapshot = await users.where("uid" ,isEqualTo: uid).get();

   final user = snapshot.docs.map((e)=> UserModel.fromSnapshot(e as DocumentSnapshot<Map<String, dynamic>>)).single;
   return user;
  }

  signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  passwordReset(String userEmail) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: userEmail);
    }
    catch (e) {
      debugPrint(e.toString());
    }
  }

  storeMediaInFirebaseStorage(File media,String uid,String fileName) async {
    try {
      Reference reference = storage.ref().child('media/$fileName');
      UploadTask uploadTask = reference.putFile(media);
      TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {});
      String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      String fileUrl = downloadUrl;

      users.doc(uid).update({
        'media' :  FieldValue.arrayUnion([{
          'name':fileName,
          'filePath':fileUrl
        }]),
      });

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  uploadAllFiles(List<PlatformFile> list, String uid) async {
    for (var i in list){
      File temp = File(i.path!);
      await storeMediaInFirebaseStorage(temp, uid,i.name );
    }
  }
  storeImageInFirebaseStorage(File image,String uid,String fileName,String? previousFile) async {
    try {
      Reference reference = storage.ref().child('images/$fileName');

      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {});
      String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      String imageUrl = downloadUrl;

      users.doc(uid).update({
        'avatar' :  imageUrl,
      });
      deleteFileFromFirebase(previousFile!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  deleteFileFromFirebase(String previousFile){
    final ref = storage.refFromURL(previousFile);
    ref.delete();
  }
  deleteMedia(Map<String,dynamic> item,String uid, int index){
    users.doc(uid).update({
      'media' :  FieldValue.arrayRemove([item]),
    });

  }
}
