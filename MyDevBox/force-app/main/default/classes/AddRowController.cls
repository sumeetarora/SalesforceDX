public with sharing class AddRowController {

    public PageReference Save() {
        for(Student__c s:StuList){
            if(s.Sname__c!=null && s.sclass__c!= null && s.semail__c!=null){
                stulistnew.add(s);
            }
        }
        insert stuListnew;
        Pagereference pg = new Pagereference('/'+'a01/o');
        return pg;
    }


    public void AddRow() {
        stulist.add(new Student__c());
        
    }

    public List<Student__c> StuList{get;set;}
    public List<Student__c> stulistnew{get;set;}
    public AddRowController(){
        stulist= new List<Student__c>();
       stulistnew= new List<Student__c>();
       addrow();
    }
}