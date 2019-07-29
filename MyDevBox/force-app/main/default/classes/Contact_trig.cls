public class Contact_trig{

    public static void beforeins(List<Contact> cbefore){
        for(Contact c : cbefore){
            if(c.Email!= NULL || c.Level__c=='Primary')
                c.Title = 'Master';
            else
                c.addError('Please provide the Email!!!');
        }
    }

    public static void afterins( List<Contact> cafter){
        List<Account> a = [select id, SLA__c from Account];
        for(Contact c : cafter){
            for(Account an : a){
                if(c.AccountId==an.id){
                    an.SLA__c='Gold';
                }
            }
        }
        update a;
    }
}