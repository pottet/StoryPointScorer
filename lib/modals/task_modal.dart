class TaskModel {
  final int id;
  final String name;
  final String members;
  final String? storypoints;

  TaskModel({required this.id, required this.name, required this.members,this.storypoints});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    //if (json == null) return null;
    return TaskModel(
      id: json["id"],
      name: json["name"],
      members: json["members"],
      storypoints: json["storyPoints"],
    );
  }

  static List<TaskModel> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => TaskModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(TaskModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => name;
}