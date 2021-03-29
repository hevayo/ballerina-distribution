// This is the client implementation for the server streaming scenario.
import ballerina/io;

// The client endpoint configuration.
HelloWorldClient ep = check new("http://localhost:9090");

public function main (string... args) returns error? {
    // Execute the streaming RPC call that registers
    // the server message listener and gets the response as a stream.
    stream<string, grpc:Error?> result = check ep->lotsOfReplies("WSO2");
    // Iterate through the stream and print the content.
    error? e = result.forEach(function(string str) {
        io:println(str);
    });
}
