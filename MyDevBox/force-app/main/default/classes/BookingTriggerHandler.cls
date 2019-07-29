public class BookingTriggerHandler {

	private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    
    
    public BookingTriggerHandler(boolean isExecuting, integer size)
    {
        m_isExecuting = isExecuting;
        BatchSize = size;
    }
            

    public void OnBeforeInsert(List<Booking__c> newBooking)
    {
        system.debug('Trigger On Before Insert');
    }
    public void OnAfterInsert(List<Booking__c> newBooking)
    {
        system.debug('Trigger On After Insert');
        BookingAfterUpdateActions.CreateEventsForRelatedContacts(newBooking);
    }
    public void OnAfterUpdate( List<Booking__c> newBooking, List<Booking__c> oldBooking, Map<ID, Booking__c> newBookingMap , Map<ID, Booking__c> oldBookingMap )
    {
        system.debug('Trigger On After Update ');
        
    }
    public void OnBeforeUpdate( List<Booking__c> newBooking, List<Booking__c> oldBooking, Map<ID, Booking__c> newBookingMap , Map<ID, Booking__c> oldBookingMap )
    {
        system.debug('Trigger On Before Update ');
        
        //
    }


}