public class insert_teacher_record {

    public Teacher__c t{ get; set; }
    
    public insert_teacher_record(){
      t = new Teacher__c();
    }

    public void  saveRecord() {
        insert t;
    }
}