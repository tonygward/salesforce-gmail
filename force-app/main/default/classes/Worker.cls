public with sharing class Worker {
    
    // this is a test
    // so is this
    
    public Boolean mErrorRaised { get; private set; }

    public void doSomething() {
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('http://www.google.co.uk');
        HttpResponse response = new HttpResponse();
        response.setStatusCode(401);
        response.setBody('boom');
        
        try {
            throw new WorkerException('oh dear');
        } catch (Exception ex) {
            onError(ex.getMessage());
            //throw new WorkerException(ex.getMessage(), ex);
        }
    }

    private void onError(string name) {        
        LogError__e errorLog = new LogError__e();
        errorLog.Name__c = name;
        Database.SaveResult result = Eventbus.publish(errorLog);
        if (result.isSuccess()) {
            // this.mErrorRaised = true;
        }
    }
}