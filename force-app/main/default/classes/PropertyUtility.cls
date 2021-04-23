public class PropertyUtility {
    
    public static List<Property__c> newPropList;
    
    public static void newListedProperties() {
        newPropList = [SELECT Id, Name, Broker__r.Name FROM Property__c];
    }
}