import ballerinax/jaeger as _;
import ballerina/http;

// Simple `Hello` HTTP Service
service /hello on new http:Listener(9234) {

    // Resource functions are invoked with the HTTP caller and the
    // incoming request as arguments.
    resource function get sayHello() returns string {
        return "Hello, World!";
    }

    resource function get sayBye() returns string{
        
        return "Bye, World!";
    }
}
