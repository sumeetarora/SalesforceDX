public with sharing class StudentDetailController {

    public PageReference edit() {
        Pagereference pg = new Pagereference('/'+'apex/StudentEditPage');
        return pg;
    }

    public List<Student__c> stList{get;set;}
    public StudentDetailController(){
        stlist = new List<student__c>();
        stlist = [Select sname__c,Sclass__c,semail__c from Student__c];
    }
}