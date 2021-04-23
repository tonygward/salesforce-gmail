public class extordersController {
    
    @AuraEnabled(cacheable=true)    
    public static List<OrderDetails__x> getOrderDetails(string orderId) {
        return [SELECT orderID__c, product__c, quantity__c, unitPrice__c FROM OrderDetails__x WHERE orderID__c = :orderId];
    }    
}