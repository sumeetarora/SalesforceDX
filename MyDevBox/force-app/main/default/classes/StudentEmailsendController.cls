public with sharing class StudentEmailsendController {
    
    public class modelclass{
        public Student__c stu{get;set;}
        public boolean flag{get;set;}
    }
    public modelclass m;
    public List<modelclass> md{get;set;}
    public List<Student__c> stList{get;set;}
    public StudentEmailsendController (){
        stlist = new List<student__c>();
        stlist = [Select sname__c,Sclass__c,semail__c from Student__c];
        md = new List<modelclass>();
        for(Student__c s: stlist){
            m = new modelclass();
            m.stu = s;
            m.flag = false;
            md.add(m);
        }
    }
     public void change() {
          if(!m.flag){
              m.flag=true;
          }  
          else{
              m.flag=false;
          }
    }
    public void send(){
        String em;
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('iBirds College');
        
        for(modelclass mo:md){
            if (mo.flag){
                em=mo.stu.sname__c;
                mail.setPlainTextBody(em);
                mail.setToAddresses(new List<String>{'sumeetsalesforce@gmail.com'});
                Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});
            }
        }
    }
    public void sendemailtemplate(){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new List<String>{'sumeetsalesforce@gmail.com'});
        EmailTemplate att = [select id,name from EmailTemplate where DeveloperName ='Email_template1' ]; 
        mail.setTemplateId(att.Id);
        for(modelclass m: md)
        {
            if(m.flag){
                mail.setTargetObjectId([select id from contact limit 1].id);
                mail.setWhatId(m.stu.Id);
                mail.setSaveAsActivity(false);
                Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});
            }
        }
        }
}