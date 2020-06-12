import ballerina/io;
import ballerina/lang.'int;

//const string[] OPR = ['+' ,'-','/','*'];

public function main() {
    io:println("my first ballerina");
    int|error firstValue = parse(io:readln("enter fist number: "));
    int|error secondValue = parse(io:readln("enter second number: "));    
    string operator = io:readln("enter the operator: ");
    io:println("first number = ",firstValue);
    io:println("second number = ",secondValue);
    io:println("operator = ",operator);
    if(firstValue is int && secondValue is int){
        if(operator == "+"){
            int iSum = 'int:sum(firstValue,secondValue);
            io:println(firstValue, " + ", secondValue, " = ",iSum);
        }else if(operator == "-"){
            int iSub = firstValue - secondValue;
            io:println(firstValue, " - ", secondValue, " = ",iSub);
        }else{
            io:println("invalid operator use {+ - / *}");
        }
    }else{
        io:println("please enter numbers");
    }

}
function parse(string num) returns int|error {
    return check 'int:fromString(num);
}