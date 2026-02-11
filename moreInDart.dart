import 'dart:math';

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
}