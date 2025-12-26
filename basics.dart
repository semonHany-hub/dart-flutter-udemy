import 'dart:io';
import 'dart:math';

void main(){
  print("**different text quotation marks in dart**");
  print("double quotes");
  print('single quotes');
  print(""" 
  
  triple nested quotes for multi line  text
  """);


  print("\n***multiplication table using nested for loop***");

  outerLoop:
  for(var i=1; i<=10; i++){
    innerLoop:
    for(var j=1; j<=10; j++){
      if(i==6)
        break outerLoop;
      print("$i * $j= ${i*j}");
    }
  }
  //new concept: labeling loops to use its label later for break command for example 
  //as here when we breaked the outer loop inside the inner one.


  print("\n***multiplication table using nested while loop***");

  var i=1;
  outer_loop:
  while(i<=10){
    var j=1;
    inner_loop:
    while( j<=10){
      if(j==6){
        i++;
        continue outer_loop;
      }
      print("$i * $j= ${i*j}");
      j++;
    }
  }

  print("\n***degree app***");
  for(int i=1; i<=5; i++){
    var degree=new Random().nextInt(100); 
    //create new object from the class Random declared in dart:math library 
    //integer less than 100 here.

    print("Degree=$degree");
    
    switch ((degree/10).floor()){
      case 9:
        if(degree>=95)
          print("+A");
        else
          print("-A");
      case 8:
        if(degree>=85)
          print("+B");
        else
          print("-B");
      case 7:
        if(degree>=75)
          print("+C");
        else
          print("-C");
      case 6:
        if(degree>=65)
          print("+D");
        else
          print("-D");
      case 5:
        if(degree>=55)
          print("+E");
        else
          print("-E");
      default:
        print("F");
    }
  }

  
  print("\n***calculate age from birth_Date***");

  while(true){
    try{
      print("enter your birth_Date (DD/MM/YYYY)->");
      var birth_date=stdin.readLineSync()!;
      if(birth_date.length<10)
        print("you entered invalid date format");
      else{
        int birth_year=int.parse(birth_date.substring(6));
        int age=DateTime.now().year-birth_year;
        print("your age now-> $age");
        break;
      }
    }on FormatException{
      print("invalid format!");
    }catch(error){
      print(error);
    }
    //exception handling using try-catch to enable the program end even if it found exception error 
    //like in type casting here from String to int in case the use entered "gheiksj6gw" for example.
    //this exception is FormatException handled with 'on FormatException' block.
  }
  //the infinite loop will repeat the input operation until the user enter valid format, print the required result then break.


  print("\n****numbers properties&methods****");
  print("***1- integer numbers properties***");

  int number=-8;
  print("the number we work on-> $number");
  print("is odd?-> ${number.isOdd}");
  print("is even?-> ${number.isEven}");
  print("is NaN(not a number)?-> ${number.isNaN}");
  print("is negative?-> ${number.isNegative}");
  print("is finite?-> ${number.isFinite}");
  print("is infinite?-> ${number.isInfinite}");
  print("abs (absolute value)-> ${number.abs()}");

  print("\n***2- double numbers properties***");

  double num=-4.2;
  print("the number we work on-> $num");
  print("floor-> ${num.floor()}");//the nearest less integer value considering the sign
  print("ceil-> ${num.ceil()}");//the nearest larger integer value considering the sign
  print("truncate-> ${num.truncate()}"); //round to the nearest less integer regardless of the sign (nearst twards zero).
  print("round-> ${num.round()}"); //round to the nearest integer value but away from zero as a second priority (appear in 0.5 or -0.5 only).
  
  print("remainder of $number and $num-> ${number % num}, ${number.remainder(num)}"); 
  // there's a wrong in printend value of number%num which should be -3.5 not 1.0 need deeper search******
  // '%' is euclidean modulo the result take the same sign as the divisor (num) and depend on the floor() in built hidden logic
  // ,while the truncated remainder '.remainer()' result take the divident sign (number) and depend on the truncate logic.


  print("\n***String properties&methods***");
  String name="semon";
  print("the String we work on-> $name");
  print("is empty?-> ${name.isEmpty}");
  print("is not empty?-> ${name.isNotEmpty}");
  print("toUpperCase-> ${name.toUpperCase()}");
  print("toLowerCase-> ${name.toLowerCase()}");
  print("contains 'mon'?-> ${name.contains("mon")}");
  name=name.replaceRange(2,5,"tail");
  print("after replace range 'mon' with 'tail-> $name");
  name=name.replaceFirst('e', "first 'e' replaced");
  print("after replace first occurrence of 'e'-> $name");
  print("after replace all 'i' with 'eye'-> ${name.replaceAll('i', "eye")}");

  name="s#e#m#o#n";
  List<String> nameList=name.split('#');
  print(nameList);
  String joinedName=nameList.join('.');
  print(joinedName);
  name="      "+joinedName+"    ";
  print(name);
  print(name.trim());
  //all of these prvious numbers and Srting methods are just return 
  //don't change inplace so we used print directly with each of them.
}