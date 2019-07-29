public with sharing class StudentEditController {

    public List<Student__c> stlist{get;set;}
    public List<Student__c> Editlist{get;set;}
    public List<Student__c> stlistnew{get;set;}
    public Integer Count=0,temp=0;
    
    public StudentEditController(){
        stlist=new List<Student__c>();
        stlistnew=new List<Student__c>();
        stlist = [Select sname__c, sclass__c,semail__c from Student__c];
       
    }
    public PageReference myDelete() {
        stList.remove((stList.size())-1);
        
        count++;
        return null;
    }


    public PageReference addrow() {
        stlist.add(new Student__c());
        return null;
    }


    public PageReference saveall() {
        //System.debug('#####List size'+(stlist.size()));
        //System.debug('@@@@@@@@List with count subtarcted'+(stlist.size()-count));
        temp=(stlist.size());
        for(integer i=1; i<=count; i++){
           
            delete stlist.get(temp-i);
        }
        if(Count>0)
        {
            stlist = [Select sname__c, sclass__c,semail__c from Student__c];  
        }
        for (Student__c s:stlist){
            if(s.sname__c!=null && s.sclass__c!=null && s.semail__c!=null )
            {
                stlistnew.add(s);
                
            }
        }
        Upsert stlistnew;
        return new pagereference('/'+'apex/StudentDetailPage');
    }

   
}