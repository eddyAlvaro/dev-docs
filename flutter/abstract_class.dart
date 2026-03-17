//el extends nos permite heredar todas las propiedades y metodos de una clase abstracta
//el implements tambien permite hacer herencia pero este nos permite solo utilizar metodos específicos de la clase abstracta

void main(){
  final nuclearPlant = NuclearPlant(initialEnergy: 12);
  final windPlant = WindPlant(energyLeft: 200);
  print("nuclear: ${chargePhone(nuclearPlant)}");
  print("wind: ${chargePhone(windPlant)}");
}

double chargePhone( EnergyPlant plant){
  if(plant.energyLeft < 10) throw Exception('Plant has no energy');
  return plant.energyLeft - 10;
}

enum PlantType {
  nuclear, wind, water
}

abstract class EnergyPlant {
  double energyLeft;
  PlantType type;

  EnergyPlant({ required this.energyLeft, required this.type});

  void consumeEnergy(double amount);
}

class NuclearPlant extends EnergyPlant {

  NuclearPlant( { required double initialEnergy})
    : super( energyLeft: initialEnergy, type: PlantType.nuclear);

  @override
  void consumeEnergy(double amount){
    energyLeft -= amount;
  }
}

class WindPlant implements EnergyPlant {
  @override
  double energyLeft;
  @override
  PlantType type = PlantType.wind;

  WindPlant({ required this.energyLeft  });

  @override
  void consumeEnergy(double amount){
    energyLeft -= amount;
  }
}
