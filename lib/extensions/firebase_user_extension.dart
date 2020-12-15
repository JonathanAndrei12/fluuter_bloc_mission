part of 'extensions.dart';

//User disini berbeda dengan Users yang ada di model users
//FirebaseUser --> User
extension FirebaseUserExtension on User{

  Users convertToUser({String name = "No Name"}) => Users(this.uid, this.email, name: name);

}