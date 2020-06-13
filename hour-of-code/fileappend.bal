import ballerina/io;
import ballerina/file;

const string STORAGE_NAME = "/Users/asankaa/Downloads/store.txt";

public function main() {
    string sName = io:readln("Enter the name ; ");
    string sAge = io:readln("Enter the age :  ");
    //check file
    string|error fileInfo;
    if(file:exists(STORAGE_NAME)){
        io:println("storage exisit");
    }else{
       fileInfo = file:createFile(STORAGE_NAME);
       if (fileInfo is string){
           io:println("storage created",fileInfo);
       }else{
           io:print("faile to create storage",error);
           return;
       }
    }
    //append the file
    io:WritableCSVChannel|error fileAppender = io:openWritableCsvFile(STORAGE_NAME);
    if (fileAppender is error) {
      return;
    } else {
        string[] sArray = [sName,sAge]; 
        error? write = fileAppender.write(sArray);
        io:println("record appended : ",fileAppender.toString());
        error? closeResult = fileAppender.close();
    }
    
}