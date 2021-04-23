@isTest
global class SelfShuntTests implements HttpCalloutMock {
    
    static testMethod void MyTest() {
        SelfShuntTests mockHttp = new SelfShuntTests(200, '{ "message": "hello world" }');
        Test.setMock(HttpCalloutMock.class, mockHttp);        
        // Act
        // Assert
    }

    global SelfShuntTests(Integer statusCode, string body) {
        this.StatusCode = statusCode;
        this.Body = body;
    }

    private Integer StatusCode;
    private string Body;

    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setStatusCode(StatusCode);
        response.setBody(Body);
        return response;
    }
}