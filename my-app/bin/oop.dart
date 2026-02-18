class Student{
  String name='';
  int ?age;
  int ?level;
  static String faculty='';

  static
  info(name, age, level){
    print("name-> ${name}");
    print("age-> ${age}");
    print("faculty-> ${faculty}");
    print("level-> ${level}\n");
  }//we passed the parameters to this function instead of a constructor because the properties can't be accessed with 'this' keyword inside a static method (or they must be static too).
}

abstract class Animal{
  breathe();
}

mixin Bear{
  canBear();
}

class Mammal extends Animal with Bear{
  String gender;
  Mammal(this.gender);

  @override
  breathe(){
    print("all animals (including mammals) can breathe");
  }

  @override
  canBear(){
    print("mammals have the ability to bear");
  }

  breastfeeds(){
    if(this.gender=="female")
      print("can breastfeeds");
    else
      print("can't breastfeeds");
  }
}

class Dog implements Mammal, Animal{
  bool ?hasLaryngitis; //inflammation of the voice box
  static const String kingdom= "Animalia"; //Only static fields can be declared as const.
  final String class_= "Mammalia"; //can also be initialized later within the constructor.
  @override String gender;

  Dog(this.gender, this.hasLaryngitis);

  @override
  breathe(){
    print("all animals (including the mammal dogs) can breathe");
  }

  @override
  canBear(){
    if(this.gender=="female")
      print("can give birth");
    else
      print("can't give birth");
  }

  @override
  breastfeeds(){
    if(this.gender=="female")
      print("can breastfeeds");
    else
      print("can't breastfeeds");
  }

  canBark(){
    if(!this.hasLaryngitis!)
      print("can bark");
    else
      print("can't bark");
  }
}

void main(){
  //using class with static actions & attributes
  Student.faculty="FCI";
  Student.info("semon", 21, 3);

  Student.faculty="medicine";
  Student.info("john", 20, 3);

  // Animal anm1=Animal(); //abstract class can't be instantiated
  Dog dog1=Dog("female", false);
  dog1.breastfeeds();
  dog1.canBear();
  dog1.canBark();

  //enum class
  print("\n***enum class***");
  print("${Color.values}\n");
  Color.values.forEach((Color c){
    printColor(c);
  });

  //generic class
  print("\n***generic class***");
  Generic<int, String> g1=Generic(1, "semon");
  g1.printValues();

  Generic<String, bool> g2=Generic("FCI", true);
  g2.printValues();

}

enum Color{
  red, green, blue, pink, grey
}

void printColor(Color c){
  switch(c){
    case Color.red:
      print("${Color.red.index +1} : red");
      break;
    case Color.green:
      print("${Color.green.index +1} : green");
      break;
    case Color.blue:
      print("${Color.blue.index +1} : blue");
      break;
    case Color.pink:
      print("${Color.pink.index +1} : pink");
      break;
    case Color.grey:
      print("${Color.grey.index +1} : grey");
      break;
  }
}

class Generic<T, E>{
  late T x;
  late E y;

  Generic(this.x, this.y);

  printValues(){
    print("x-> ${x}");
    print("y-> ${y}");
  }
}