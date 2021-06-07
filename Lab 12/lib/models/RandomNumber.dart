class RandomNumber{
  int id;
  int value;
  DateTime timestamp;

  RandomNumber(this.value){this.timestamp = DateTime.now();}

  RandomNumber.fromMap(Map<String,dynamic> map){
    id = map['id'];
    value = map['value'];
    timestamp = DateTime.fromMillisecondsSinceEpoch(map['timestamp']);
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : this.id,
      "value" : this.value,
      "timestamp" : this.timestamp.millisecondsSinceEpoch
    };
  }

  @override
  String toString(){
    return 'Random Number {id: $id, value: $value, timestamp: ${timestamp.toString()}';
  }
}