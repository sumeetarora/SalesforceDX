trigger contact_trig_insert on Contact (before insert, after insert) {

    if(Trigger.Isinsert){
        if(Trigger.IsBefore){
            Contact_trig.beforeins(Trigger.New);
        }
        else if((Trigger.IsAfter)){
            Contact_trig.afterins(Trigger.New);
        }
    }
}