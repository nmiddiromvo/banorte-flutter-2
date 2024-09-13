class Contact {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String pictureUrl;

  Contact(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.pictureUrl});

  Contact copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? pictureUrl,
  }) {
    return Contact(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      pictureUrl: pictureUrl ?? this.pictureUrl,
    );
  }

  factory Contact.fromMap(Map<String, dynamic> contactJson) {
    return Contact(
      firstName: contactJson['name']['first'],
      lastName: contactJson['name']['last'],
      email: contactJson['email'],
      phone: contactJson['phone'],
      pictureUrl: contactJson['picture']['thumbnail'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': {
        'first': firstName,
        'last': lastName,
      },
      'email': email,
      'phone': phone,
      'picture': {
        'thumbnail': pictureUrl,
      },
    };
  }
}
