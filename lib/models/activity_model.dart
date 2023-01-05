class Activity {
  late final int id;
  late final String name;
  late final String discription;
  late final int timestamp;
  late final bool isCompleted;
  Activity(this.id,this.name,this.discription,this.timestamp,this.isCompleted);

  Map<String,dynamic> toMap(){
    return {
      'id':  id,
      'name' :name,
      'discription' :discription,
      'timestamp' : timestamp,
      'isCompleted':isCompleted
    };
  }

  @override
  String toString(){
    return "Activity{ id:$id,name:$name,discription:$discription,timestamp:$timestamp,isCompleted:$isCompleted}";
  }


}