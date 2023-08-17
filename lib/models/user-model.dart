// A class to hold user model
class UserModel {

  // variable to hold user access token
  String? accessToken;

  // variable to hold user details
  User? user;

  UserModel({
    this.accessToken,
    this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    accessToken: json["accessToken"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "user": user?.toJson(),
  };
}

class User {
  
  // varible to hold user firstName
  String? firstName;

  // varible to hold user lastName
  String? lastName;

  // varible to hold user userName
  String? userName;
  
  // varible to hold user email
  String? email;

  User({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    userName: json["user_name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "user_name": userName,
    "email": email,
  };
}
