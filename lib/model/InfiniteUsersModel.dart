class InfiniteUsersModel {
  InfiniteUsersModel({
      this.success, 
      this.message, 
      this.totalUsers, 
      this.offset, 
      this.limit, 
      this.users,});

  InfiniteUsersModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    totalUsers = json['total_users'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  int? totalUsers;
  int? offset;
  int? limit;
  List<Users>? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['total_users'] = totalUsers;
    map['offset'] = offset;
    map['limit'] = limit;
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Users {
  Users({
      this.id, 
      this.gender, 
      this.dateOfBirth, 
      this.job, 
      this.city, 
      this.zipcode, 
      this.latitude, 
      this.profilePicture, 
      this.email, 
      this.lastName, 
      this.firstName, 
      this.phone, 
      this.street, 
      this.state, 
      this.country, 
      this.longitude,});

  Users.fromJson(dynamic json) {
    id = json['id'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    job = json['job'];
    city = json['city'];
    zipcode = json['zipcode'];
    latitude = json['latitude'];
    profilePicture = json['profile_picture'];
    email = json['email'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    phone = json['phone'];
    street = json['street'];
    state = json['state'];
    country = json['country'];
    longitude = json['longitude'];
  }
  int? id;
  String? gender;
  String? dateOfBirth;
  String? job;
  String? city;
  String? zipcode;
  double? latitude;
  String? profilePicture;
  String? email;
  String? lastName;
  String? firstName;
  String? phone;
  String? street;
  String? state;
  String? country;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['gender'] = gender;
    map['date_of_birth'] = dateOfBirth;
    map['job'] = job;
    map['city'] = city;
    map['zipcode'] = zipcode;
    map['latitude'] = latitude;
    map['profile_picture'] = profilePicture;
    map['email'] = email;
    map['last_name'] = lastName;
    map['first_name'] = firstName;
    map['phone'] = phone;
    map['street'] = street;
    map['state'] = state;
    map['country'] = country;
    map['longitude'] = longitude;
    return map;
  }

}