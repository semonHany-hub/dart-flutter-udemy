import 'dart:io';
void main() async{
  File file=File("data.txt"); //File class declared in dart:io library. 
  //the passed path parameter is relative to the current working directory(CWD) (my-app/bin)
  if(await file.exists()){
    print("File already exists...");
    await file.readAsString().then((value) => print(value)); //also it's enough to handle the Future by either async-await or .then().catchEror()
    //, without await here it will throw unhandled exception of 'can't deleting File as it used by another process which is the method readAsSync().
    file.copySync("data_copy.txt");
    print("File copied successfully...");
    file.deleteSync();
    print("File deleted successfully...");

  }else{
    print("File not found...");
    file.create().then((value) => print("File created successfully..."));
    file.writeAsStringSync("Hello, Semon Hany...");
  }
}