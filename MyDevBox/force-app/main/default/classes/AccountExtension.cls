public class AccountExtension {
    
    
    Account acc ;
    Id accId;
    public AccountExtension(ApexPages.StandardController controller) {
     acc =  (Account)controller.getRecord();
     accId = controller.getId();
    }
    
    Public PageReference createContact(){
    
    
    Contact c =  new Contact();
    c.LastName = acc.Name;
    c.AccountId = acc.Id;
    Insert c;
    return new PageReference ('/' + c.Id);
    }

}