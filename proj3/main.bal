import ballerinax/jaeger as _;
import ballerina/http;

// Simple `Hello` HTTP Service
service /helloSecond on new http:Listener(9235) {

    // Resource functions are invoked with the HTTP caller and the
    // incoming request as arguments.
    resource function get saySecondHello() returns string {
        return "Hello, World!";
    }

    resource function get saySecondBye() returns string{
        
        return "Bye, World!";
    }
}
