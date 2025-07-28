import 'package:isar/isar.dart';

part 'User.g.dart';

@collection
@Name("User")
class User {
  @Name("id")
  Id id = Isar.autoIncrement;

  @Name("name")
  String? name;

  @Name("MainPocket")
  MainPocket mainPocket = MainPocket();

  @Name("SubPockets")
  SubPocket subPocket = SubPocket();
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
  List<int> image = [];
}
