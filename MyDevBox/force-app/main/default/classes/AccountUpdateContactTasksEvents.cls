public without sharing class AccountUpdateContactTasksEvents {
    public static void updateRelated_Contact_Tasks_Events(List<Account> Acc,Map<ID, Account> newAccountMap){
        List<string> AllAccountId = new List<string>();
        for(string a:newAccountMap.keyset()){
            AllAccountId.add(a);
        }
        List<Contact> AllCon = [Select Id, Name,AccountID from Contact where AccountId IN :AllAccountId];
        List<Task> AllTasks = [SELECT Id, Subject, WhatID FROM Task WHERE WhatID IN :AllAccountId];
        List<Event> AllEvent = [SELECT Id, Subject, WhatID FROM Event WHERE WhatID IN :AllAccountId];
    }
}