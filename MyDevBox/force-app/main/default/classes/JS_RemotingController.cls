global class JS_RemotingController {

    public boolean t {get; set;}
    public String accountName { get; set; }
    public static Account account { get; set; }
    public static Integer empno { get; set; }
    public JS_RemotingController() { } // empty constructor
    
    @RemoteAction
    global static Account getAccount(String accountName) {
        try{
            String query = 'SELECT Id, Name, Phone, Type, NumberOfEmployees ' + 
                            'FROM Account WHERE Name Like \'%' +  accountName + '%\'';
            account =  Database.query(query);
            System.debug('get');
            
        }
        catch(DmlException e){
            system.debug(e.getmessage());
        }
       return account;
    }
    @RemoteAction
    global static Account updateaccount(String accountName, Integer n){
    boolean t = true;
        String query = 'SELECT Id, Name, Phone, Type, NumberOfEmployees ' + 
                        'FROM Account WHERE Name Like \'%' +  accountName + '%\'';
        Account[] myname = [Select Name from Account];                
        for(Account acc : myname){
            if(acc.Name == accountName){
                t= false;
                break;
            }
        }
        
        System.debug(t);
        if(!t){
            account =  Database.query(query);
            account.NumberOfEmployees = n;
            
        }
        else{
            account = new Account();
            account.NumberOfEmployees = n;
            account.Name = accountName; 
        }
        upsert account;
        
        return account;        
        
    }

}