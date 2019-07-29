public with sharing class StudentDetailAjaxController {

 
    public String check { get; set; }

    public PageReference edit() {
        Pagereference pg = new Pagereference('/'+'apex/StudentEditPage');
        return pg;
    }

    public List<Student__c> stList{get;set;}
    public List<Studentmodel> model{get;set;}
    public List<Student__c> tempDltList; 
    public Studentmodel m{get;set;}
    public Integer count=0;
    public StudentDetailAjaxController(){
        tempDltList= new List<Student__c>();
        stlist = new List<student__c>();
        model = new List<Studentmodel>();
        stlist = [Select sname__c,Sclass__c,semail__c from Student__c];
        for(Student__c s: stList){
            m= new Studentmodel();
            m.stu = s;
            m.flag= false;
            m.sno = count;
            model.add(m);
            count++;
        }
    }
    public class Studentmodel{
        public boolean flag{get;set;}
        public Student__c stu{get;set;}
        public Integer Sno{get;set;}
    }
    
    public void change() {
          if(!m.flag){
              m.flag=true;
          }  
          else{
              m.flag=false;
          }
    }
    public void del(){
        for(StudentModel sm: model){
            if(!sm.flag){
                tempdltList.add(sm.stu);
            }
            else{
                Integer temp= sm.sno;
                System.debug('Temp value is'+temp);
                //sm.remove();
            }
        }
    }
}