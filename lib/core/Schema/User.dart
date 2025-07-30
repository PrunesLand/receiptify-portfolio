import 'package:isar/isar.dart';

part 'User.g.dart';

@collection
@Name("User")
class User {
  @Name("id")
  Id id;

  @Name("name")
  String? name;

  @Name("MainPocket")
  MainPocket mainPocket = MainPocket();

  @Name("SubPockets")
  List<SubPocket?> subPocket = [];

  User({this.id = 1, this.name}); // Defaulting to ID 1

  static const int singleUserId = 1;
}

@embedded
class SubPocket {
  @Name("pocketName")
  String pocketName = '';

  @Name("totalExpense")
  String totalExpense = '0';

  @Name("expenses")
  List<Document> expenses = [];
}

@embedded
class MainPocket {
  @Name('totalExpense')
  String totalExpense = '0';

  @Name('expenses')
  List<Document> expenses = [];
}

@embedded
class Document {
  @Name("fileName")
  String fileName = '';

  @Name("totalExpense")
  String totalExpense = '0';

  @Name("image")
  List<byte> image = [];
}
