@isTest
public with sharing class WorkerTests {
    @isTest static void doSomethingTest() {
        
        Worker actual = new Worker();
        
        Test.startTest();        
        try {
            actual.doSomething();        
        } catch (Exception ex) {
            // continue
        }
        Test.stopTest();        

        System.assertEquals(true, actual.mErrorRaised);
    }
}