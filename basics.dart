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


  print("\n\n****Lists****");
  List<int> list1=[7,2,93,25,3];
  print(list1);

  print("\n***accessing first element (indexing, method)***");
  print(list1[0]);
  print(list1.first);

  print("\n***accessing last element (indexing, method)***");
  int last_index=list1.length-1;
  print(list1[last_index]);
  print(list1.last);

  print("\n***add element(s) at the end***");
  list1[2]=8;
  list1.add(10);
  list1.addAll([7,2,4]);
  print(list1);

  print("\n***insert element(s) at a specific position***");
  list1.insert(3, 44);
  list1.insertAll(4, [55,77,22]);
  print(list1);

  print("\n***remove item(s)***");
  list1.remove(10);
  list1.removeAt(2);
  list1.removeLast();
  list1.removeRange(2,4);
  print(list1);

  print("\n***replace range and reverse***");
  list1.replaceRange(2,4, [6,8,2,5]);
  print(list1.reversed);

  print("\n***looping on list(for, for...in, forEach)***");
  for(int i=0; i<=list1.length-1; i++)
    print(list1[i]);

  print("\n");
  for(int item in list1)
    print(item);

  print("\n");
  list1.forEach((item){
    print(item);
  });

  print("\n***looping on 2D list***");
  List<List<int>> list2=[[5,8,3], [9,3,6]];
  print(list2);

  for(var i=0; i<=1; i++){
    for(var j=0; j<=2; j++)
      print(list2[i][j]);
  }

  print("\n");
  for(var i in list2)
    for(var j in i)
      print(j);

  print("\n\n****Sets****");
  Set<int> set1={7,2,9,4};
  print(set1);

  print("\n***add element(s) at the end***");
  set1.add(54);
  set1.addAll([8,2,5,3]);
  print(set1);

  print("\n***check membership and remove***");
  print(set1.contains(54));
  set1.remove(54);
  print(set1.contains(54));
  print(set1.elementAt(0));

  print("\n***looping on Set***");
  set1.forEach((element){
    print(element);
  });

  print("\n***check empty state and clear content***");
  print(set1.isNotEmpty);
  set1.clear();
  print(set1.isEmpty);

  print("\n***operations on Sets***");
  set1={7,2,9,3};
  var set2=<int> {8,2,4,7};

  print("union: ${set1.union(set2)}");
  print("intersection: ${set1.intersection(set2)}");
  print("set1 difference set2: ${set1.difference(set2)}");
  print("set2 difference set1: ${set2.difference(set1)}");

  
  print("\n\n****Maps****");
  Map<String, dynamic> map={
    "name":"semon hany",
    "age":21,
    "faculty":"FCI",
    "hoppy":"coding"
  }; //map name arise from [key:value] pairs mapping like in hash table.

  print(map);

  print("\n***keys, values, entries iterables***");
  print(map.keys);
  print(map.values);
  print(map.entries);

  print("\n***check membership & add new entries***");
  print(map.containsValue("FCI"));
  map.remove("age");
  print(map.containsKey("age"));
  map.addAll({"section":"CS", "level":3});
  print(map);

  print("\n***looping on map(for...in , forEach)***");
  for(String key in map.keys)
    print("[$key:${map[key]}]");
  
  print("\n");
  for(var value in map.values)
    print(value);

  print("\n");
  for(var entry in map.entries)
    print("[${entry.key}:${entry.value}]");
  
  print("\n");
  map.forEach((key, value){
    print("[$key:$value]");
  });
}