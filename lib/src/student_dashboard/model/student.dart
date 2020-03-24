class Student {
   String id;
   String firstName;
   String lastName;
   int age;
   String photoUrl;
   String description;

   Student({this.id, this.firstName, this.lastName, this.age, this.photoUrl,
       this.description});

   @override
  String toString() => '$id, $firstName, $lastName, $age, $photoUrl, $description';

  Map<String, dynamic> asMap() {
      return {
         'firstName': firstName,
         'lastName': lastName,
         'age': age,
         'photoUrl': photoUrl,
        'description': description
      };
  }

}