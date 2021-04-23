@isTest
global class ApiCalloutTests implements HttpCalloutMock {
 
    @isTest static void onSuccess_doNotLog() {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(50);
        ApiCalloutTests mock = new ApiCalloutTests(response);
        Test.setMock(HttpCalloutMock.class, mock);

        HttpRequest request = new HttpRequest();        
        request.setEndpoint('http://success');
        ApiCallout api = new ApiCallout();
        api.send(request);             
        
        List<ApiCallout__c> actuals = [SELECT Id FROM ApiCallout__c];
        System.assertEquals(true, actuals.isEmpty());        
    }

    @isTest static void onError_Log() {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(500);
        ApiCalloutTests mock = new ApiCalloutTests(response);
        Test.setMock(HttpCalloutMock.class, mock);

        HttpRequest request = new HttpRequest();        
        request.setEndpoint('http://error');
        ApiCallout api = new ApiCallout();
        api.send(request);         
        
        List<ApiCallout__c> actuals = [
            SELECT Id, 
                RequestUrl__c, 
                Request__c, 
                Response__c,
                ResponseStatusCode__c                
            FROM ApiCallout__c];
        System.assertNotEquals(true, actuals.isEmpty());

        ApiCallout__c actual = actuals[0];
        System.assertEquals('http://error', actual.RequestUrl__c);
        System.assertEquals(request.toString(), actual.Request__c);        
        System.assertEquals(response.toString(), actual.Response__c);
        System.assertEquals(500, actual.ResponseStatusCode__c);
    }

    // #region HttpMock

    private HttpResponse mResponse { get; set; }

    global ApiCalloutTests(HttpResponse response) {
        this.mResponse = response;
    }

    global HttpResponse respond(HttpRequest request) {
        return this.mResponse;
    }

    // #endregion
}