public with sharing class BulkInsertController {

    public PageReference pg;
    public PageReference Save() {
        insert s1;
        insert s2;
        insert s3;
        return null;
    }


    public Student__c s1{get;set;}
    public Student__c s2{get;set;}
    public Student__c s3{get;set;}
    
    public BulkInsertController(){
        s1=new Student__c();
        s2=new Student__c();
        s3=new Student__c();
        //pg = new PageReference();
    }
}