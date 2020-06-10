import ballerina/io;
import ballerina/lang.'int;
public function main() {
    io:println("my first ballerina");
    int|error firstValue = parse(io:readln("enter fist number: "));
    int|error secondValue = parse(io:readln("enter second number: "));    
    io:println("first number = ",firstValue);
    io:println("second number = ",secondValue);
    if(firstValue is int && secondValue is int){
        int iSum = 'int:sum(firstValue,secondValue);
        io:println(firstValue, " + ", secondValue, " = ",iSum);
    }else{
        io:println("please enter numbers");
    }

}
function parse(string num) returns int|error {
    return check 'int:fromString(num);
}