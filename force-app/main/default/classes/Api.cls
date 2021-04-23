public class Api {

    ApiSettings settings;

    public Api() {

    }

    public Api(ApiSettings settings) {
        this.settings = settings;
    }

    public HttpResponse Get(string url) {
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        return Send(request, url);
    }    

    private HttpResponse Send(HttpRequest request, string url) {        
        request.setEndpoint(url);               
        Http http = new Http();
        HttpResponse response = http.send(request);      
        
        return response;  
    }
}