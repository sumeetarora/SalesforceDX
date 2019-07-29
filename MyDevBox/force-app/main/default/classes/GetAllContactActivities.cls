public without sharing class GetAllContactActivities {
    
	@AuraEnabled
	 public static List<Contact> findActivityByContact(String searchKey) {
        return [SELECT Id,
                ( SELECT WhoId,Who.Name,Subject,StartDateTime,ActivityDate ,ActivityType,Description,CreatedBy.Name,Status,WhatId FROM ActivityHistories order by ActivityDate  desc NULLS LAST LIMIT 150),
                (SELECT Subject,StartDateTime,CreatedBy.Name, WhoId,Who.Name, IsTask, ActivityDate, Status, Priority, OwnerId FROM OpenActivities order by ActivityDate desc NULLS LAST)
                FROM Contact where Id=:searchKey ];
         /*list<wrapContact> temp = new list<wrapContact>();
         for(Contact c: cAll){
            wrapContact w= new wrapContact();
            w.con = c;
            w.diff = 5;
            temp.add(w);
         }*/
         //return temp;
         //return cAll; 
     }
}