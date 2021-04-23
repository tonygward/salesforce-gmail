public without sharing class ApiCallout {
    public ApiCallout() {

    }

    public HttpResponse send(HttpRequest request) {
        Http http = new Http();
        HttpResponse response = http.send(request);

        // Success
        if (response.getStatusCode() < 300 ) {
            return response;
        }

        // Error
        LogError(request, response);
        return response; 
    }

    private static void LogError(HttpRequest request, HttpResponse response) {
        ApiCallout__c api = new ApiCallout__c();
        api.RequestUrl__c = request.getEndpoint();  
        api.Request__c = request.toString();  
        api.Response__c = response.toString();    
        api.ResponseStatusCode__c = response.getStatusCode();        
        insert api;
    }
}