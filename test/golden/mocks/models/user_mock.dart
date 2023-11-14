import 'package:ser_manos/models/models.dart';

const User completeUserMock = User(
  uid: "complete",
  name: "Bruno",
  surname: "Squillari",
  email: "email@gmail.com",
  phone: "+123456",
  birthday: "01/11/2023",
  gender: Gender.male,
  completed: true,
);

const User incompleteUserMock = User(
  uid: "incomplete",
  name: "incomplete",
  surname: "incomplete",
);
