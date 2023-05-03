import ballerinax/jaeger as _;
import ballerina/http;

    http:Client myClient = check new ("http://localhost:9234/hello");

// Simple `Hello` HTTP Service
service /hellodeleg on new http:Listener(9236) {


    // Resource functions are invoked with the HTTP caller and the
    // incoming request as arguments.
    resource function get sayDelegHello() returns string {
        string|error val = myClient -> get("/sayHello");
        if val is error {
            return "Error";
        }else {
            return val;
        }
    }

    resource function get sayDelegBye() returns string{
        string|error val = myClient -> get("/sayBye");
        if val is error {
            return "Error";
        } else{
            return val;
        }
    }
}
