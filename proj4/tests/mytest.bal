import ballerina/test;
import ballerina/http;
// import ballerina/observe;
import ballerinax/jaeger as _;

// import ballerina/log;

http:Client myClient = check new ("http://localhost:9234/hello");
http:Client myClient2 = check new ("http://localhost:9235/helloSecond");
http:Client myClient3 = check new ("http://localhost:9236/hellodeleg");
http:Client testDetailsClient = check new ("http://localhost:9237/test");

@test:Config {}
function mytest1() returns error? {

    http:Response _ = check testDetailsClient->post("/startTest?testName=mytest1", {});

    http:Response val = check myClient->get("/sayHello");
    http:Response _ = check testDetailsClient->post("/endTest?testName=mytest1", {});

    test:assertEquals(val.statusCode, 200, "Status code should be 200");

}

@test:Config {}
function mytest2() returns error? {
    http:Response val = check myClient->get("/sayBye");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {}
function mytestSecond1() returns error? {
    http:Response val = check myClient2->get("/saySecondHello");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {}
function mytestSecond2() returns error? {
    http:Response val = check myClient2->get("/saySecondBye");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {}
function mytestDeleg1() returns error? {
    http:Response val = check myClient3->get("/sayDelegHello");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {}
function mytestDeleg2() returns error? {
    http:Response val = check myClient3->get("/sayDelegBye");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}
