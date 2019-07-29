@isTest
public class BookingHandlerTestClass {
    static testMethod void TestHandler() {
        Test.startTest();
        Contact c=new Contact(
        FirstName='fname',
        LastName = 'lname',
        Email = 'abc@abc.com',
        Phone = '123456789'); 
        insert c; 
        Booking__c b = new Booking__c();
        b.name = 'Abc';
        b.ContactID__c = c.id;
        insert b;
        Test.stopTest();
    }
}