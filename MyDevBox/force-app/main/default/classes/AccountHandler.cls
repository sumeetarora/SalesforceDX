public with sharing class AccountHandler {
	private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    public static boolean IsFromBachJob ;
    public static boolean isFromUploadAPI=false;
    
    public AccountHandler(boolean isExecuting, integer size)
    {
        m_isExecuting = isExecuting;
        BatchSize = size;
    }
            

    public void OnBeforeInsert(List<Account> newAccount)
    {
        system.debug('Account Trigger On Before Insert');
    }
    public void OnAfterInsert(List<Account> newAccount)
    {
        system.debug('Account Trigger On After Insert');
    }
    public void OnAfterUpdate( List<Account> newAccount, List<Account> oldAccount, Map<ID, Account> newAccountMap , Map<ID, Account> oldAccountMap )
    {
        system.debug('Account Trigger On After Update ');
        
    }
    public void OnBeforeUpdate( List<Account> newAccount, List<Account> oldAccount, Map<ID, Account> newAccountMap , Map<ID, Account> oldAccountMap )
    {
        system.debug('Account Trigger On Before Update ');
        AccountUpdateContactTasksEvents.updateRelated_Contact_Tasks_Events(newAccount,newAccountMap);
        //
    }

}