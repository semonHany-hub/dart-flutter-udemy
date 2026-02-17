import 'dart:math';
import 'dart:io';

void main(){
    //math methods
    print("\n***math methods***");
    print("sin(30)-> ${sin(30*pi/180)}"); //these triangle methods work only with radian angles so coverted to degree by multiplying with (pi/180)
    print("cos(60)-> ${cos(60*pi/180)}");
    print("tan(45)-> ${tan(45*pi/180)}");
    print("asin(0.5)-> ${asin(0.5)*180/pi}"); //and vice versa
    print("acos(0.5)-> ${acos(0.5)*180/pi}");
    print("atan(1)-> ${atan(1)*180/pi}");
    print("sqrt(16)-> ${sqrt(16)}");
    print("pow(2,3)-> ${pow(2,3)}");
    print("max(16,25)-> ${max(16,25)}"); //accepts only two arguments
    print("min(16,25)-> ${min(16,25)}");
    print("exp(1)-> ${exp(1)}");
    print("log(100))-> ${log(100)}"); //considered as ln for base 'e' =2.7
    print("log10(100)-> ${log(100)/log(10)}"); //change-base formula: log(100)= ln(100)/ln(10)
    
    //math constants
    print("\n***math constants***");
    print("e-> $e");
    print("pi-> $pi");
    print("log10e-> $log10e");
    print("ln2-> $ln2");
    print("sqrt1_2-> $sqrt1_2"); //sqrt(1/2)
    print("sqrt2-> $sqrt2");

    //DateTime
    print("\n***DateTime Object***");
    DateTime now= new DateTime.now();
    DateTime now_60=now.add(new Duration(days:60));
    print("now-> $now");
    print("now_60-> $now_60");
    var dif=now_60.difference(now);
    print("dif-> ${dif.inDays}");

    DateTime date= new DateTime.utc(1968, 7, 11);
    DateTime date2= new DateTime.utc(2004, DateTime.november, 9);
    DateTime date3= DateTime.parse("2008-10-01 17:46:24");
    print("date-> $date");
    print("date2-> $date2");
    print("date3-> $date3");

    print("current year-> ${now.year}");
    print("date month-> ${date.month}");
    print("date2 weekday-> ${date2.weekday}");
    print("date2 day-> ${date2.day}");
    print("date3 time-> ${date3.hour}: ${date3.minute}: ${date3.second}");

    print("date is before date2?-> ${date.isBefore(date2)}");
    print("date3 is after date?-> ${date3.isAfter(date)}");

    print("DateTime.parse() return utc? ${date3.isUtc}");

    print("monthsPerYear-> ${DateTime.monthsPerYear}");
    print("daysPerWeek-> ${DateTime.daysPerWeek}");

    print("\n***weekdays***");
    print("${DateTime.monday}-> Monday");
    print("${DateTime.tuesday}-> Tuesday");
    print("${DateTime.wednesday}-> Wednesday");
    print("${DateTime.thursday}-> Thursday");
    print("${DateTime.friday}-> Friday");
    print("${DateTime.saturday}-> Saturday");
    print("${DateTime.sunday}-> Sunday");

    //Platform
    print("\n***Platform***");
    print(Platform.executable); //print the dart-sdk bin directory path
    print(Platform.numberOfProcessors); //print number of logical processors (the same as shown in task manager)
    print(Platform.operatingSystem);
    print(Platform.version); //dart-sdk version
    print(Platform.script); //the current executed file directory
    print(Platform.operatingSystemVersion);

    print("----------------\n");
    print(Platform.isIOS);
    print(Platform.isAndroid);
    print(Platform.isWindows);
    print(Platform.isLinux);
    print(Platform.isMacOS);
    print(Platform.isFuchsia);

    print("----------------\n");
    Platform.environment.forEach((key, value){
        print("$key : $value");
    });

    //operator overloading
    print("\n***operator overloading***");
    Num num1=Num(36);
    Num num2=Num(8);
    Num sum=num1+num2;
    print("objects sum-> ${sum.num}");

    //polymorphism (overriding)
    print("\n***polymorphism***");
    final shapes=<Shape>[Square(), Circle(), Rectangle()];
    for(Shape shape in shapes){
        shape.type();
    }

    //lexical closure & callable class
    print("\n***lexical closure***");
    Function fun1=(){
        String message="hello";
        Function fun2=(msg){
            message=msg;
            print(message);
        };
        return fun2;
    };

    fun1()("Hi!");

    Function countParent=(){
        int counter=2;
        return (){
            counter++;
            print("counter-> $counter");
        };
    };
    Function counter=countParent();
    counter();
    counter();
    counter();

    Human h1=Human("semon", 22);
    h1(); //callable class concept enable objects to act as a lexical closure function when we declare the special method called 'call' inside it.

    //extension function
    print("\n***extension function***"); //extension function is declaring a function on a built-in class like String or external class to extend its functionality.
    int num=parsingStrNum("26").parseInt(); //parseInt() is a built-in standalone function in javaScript but doesn't declared in dart.
    print("parsed num-> $num");
}

class Num{
    int num;
    Num([this.num=0]);

    Num operator +(Num operand2){
        return new Num(this.num+operand2.num);
    }
}

abstract class Shape{
    type(){
        print("shape...");
    } //method with implementation in abstract class doesn't have to be overrided
}

class Square extends Shape{
    typeS(){
        print("square...");
    }
}

class Circle extends Shape{
    @override
    type(){
        print("circle...");
    }
}

class Rectangle extends Shape{
    @override
    type(){
        print("rectangle...");
    }
}

class Human{
    String name='';
    int ?age;

    Human(this.name, this.age);

    call(){
        print("name: $name, age: $age");
    }
}

extension parsingStrNum on String{
    int parseInt(){
        return int.parse(this); //parse the caller object (of type String).
    }
}