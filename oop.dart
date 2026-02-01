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
  }//we passed the parameters to this function instead of a constructor because the properties can't be accessed with 'this' keyword inside a static method.
}

void main(){
  //using class with static actions & attributes
  Student.faculty="FCI";
  Student.info("semon", 21, 3);

  Student.faculty="medicine";
  Student.info("john", 20, 3);
}