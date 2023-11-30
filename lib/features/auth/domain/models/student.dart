import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    String id = '';
    String name = '';
    String lastname = '';
    String phone = '';
    String gender = '';
    String email = '';
    String password = '';
    String institutionId = '';
    String careerId = '';
    String securityQuestion = '';
    String securityAnswer = '';
    String urlImg = '';
    List<Student> toList = [];

    Student({
        this.id = '',
        this.name = '',
        this.lastname = '',
        this.phone = '',
        this.gender = '',
        this.email = '',
        this.password = '',
        this.institutionId = '',
        this.careerId = '',
        this.securityQuestion = '',
        this.securityAnswer = '',
        this.urlImg = '',
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        gender: json["gender"],
        email: json["email"],
        password: json["password"],
        institutionId: json["institution_id"],
        careerId: json["career_id"],
        securityQuestion: json["securityQuestion"],
        securityAnswer: json["securityAnswer"],
        urlImg: json["url_img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "gender": gender,
        "email": email,
        "password": password,
        "institution_id": institutionId,
        "career_id": careerId,
        "securityQuestion": securityQuestion,
        "securityAnswer": securityAnswer,
        "url_img": urlImg,
    };
}
