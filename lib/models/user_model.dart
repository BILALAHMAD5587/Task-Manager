class UserModel {
  final String uId;
  final String username;
  final String email;
  final String userDeviseToken;
  final bool isAdmin;
  final dynamic createdOn;


  UserModel({
    required this.uId,
    required this.username,
    required this.email,
    required this.userDeviseToken,
    required this.isAdmin,
    required this.createdOn,
  });

  Map<String, dynamic> toMap(){
    return {
      'uId' : uId,
      'username' : username,
      'email' : email,
      'userDeviseToken' : userDeviseToken,
      'isAdmin' : isAdmin,
      'createdOn' : createdOn,
    };
  }
  factory UserModel.formMap(Map<String, dynamic> json) {
    return UserModel(
        uId: json['uId'],
        username: json['username'],
        email: json['email'],
        userDeviseToken: json['userDeviseToken'],
        isAdmin: json['isAdmin'],
        createdOn: json['createdOn'].toString(),
    );
  }


}