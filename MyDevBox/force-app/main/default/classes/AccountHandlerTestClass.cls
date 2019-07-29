@isTest
public class AccountHandlerTestClass {
    static testMethod void AccountHandler(){
        Test.startTest();
        Account a = new Account();
        a.Name='Test';
        insert a;
        Test.stopTest();
    }
}