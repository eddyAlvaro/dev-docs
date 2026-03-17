void main(){
    
    final Map<String, dynamic> rawJson = {
      'name': 'Logan',
      'power': 'Regeneration',
      'isAlive': true
    };
    final wolverine = Hero.fromJson(rawJson);
    print(wolverine);
}

class Hero {
  String name;
  String power;
  bool isAlive;
  Hero(this.name, this.power, this.isAlive);

  @override
  String toString() {
    return 'name: $name, power: $power, isAlive: ${isAlive ? 'YES' : 'NO'}';
  }

  Hero.fromJson(Map<String, dynamic> json)
    : name = json['name'] ?? 'No name',
      power = json['power'] ?? 'No power',
      isAlive = json['isAlive'] ?? true; 

}
