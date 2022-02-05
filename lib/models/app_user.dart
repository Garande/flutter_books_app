class AppUser {
  final String? id,
      firstName,
      lastName,
      email,
      phoneNumber,
      imageUrl,
      countryCode,
      gender,
      bio;
  final int? creationDateTimeMillis, dateOfBirthTimeMillis;

  AppUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.imageUrl,
    this.creationDateTimeMillis,
    this.dateOfBirthTimeMillis,
    this.countryCode,
    this.gender,
    this.bio,
  });

  factory AppUser.fromJson(Map<String, dynamic> data) {
    return AppUser(
      id: data['id'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      imageUrl: data['imageUrl'],
      creationDateTimeMillis: data['creationDateTimeMillis'],
      dateOfBirthTimeMillis: data['dateOfBirthTimeMillis'],
      countryCode: data['countryCode'],
      gender: data['gender'],
      bio: data['bio'],
    );
  }

  toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'creationDateTimeMillis': creationDateTimeMillis,
      'dateOfBirthTimeMillis': dateOfBirthTimeMillis,
      'countryCode': countryCode,
      'gender': gender,
      'bio': bio,
    };
  }
}
