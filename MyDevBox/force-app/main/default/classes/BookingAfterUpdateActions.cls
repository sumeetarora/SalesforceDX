public without sharing class BookingAfterUpdateActions {

    public static void CreateEventsForRelatedContacts(List<Booking__c> BAll){
        List<event> Allevents = new List<Event>();
        List<string> allids = new List<string>();
        //Create events
        for(Booking__c B:BAll){
            allids.add(B.ContactId__c);
        }
        List<Contact> AllCon = [Select name,id,Account.OwnerId from Contact where id in:allids];
        for(Contact c:Allcon){
        	Event e = new Event();
            e.WhoId = c.id;
            e.OwnerId = c.Account.OwnerId;
            e.StartDateTime=datetime.now();
        	e.EndDateTime=datetime.now();
            Allevents.add(e);
        }
        insert Allevents;
    }
}