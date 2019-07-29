public with sharing class StudentCountClassController {

    public List<myMOdel> models{get;set;}
    public List<newclass__c> cls=[Select id,name from newclass__c];
    public List<newstudent__c> stu = [Select sname__c,class__c,id from newStudent__c];
    public Map<id,Integer> Countmap {get;set;} 
    
    public StudentCountClassController(){
        Countmap = new Map<id,Integer>();
        models = new List<mymodel>();
        for(newStudent__c st : stu){
            Integer cnt = CountMap.get(st.class__c);
            if(cnt == null){
                cnt = 0;
            }
            cnt++;
            
            CountMap.put(st.class__c,cnt);
            
        }
        for(newclass__c c: cls){
               myModel model= new myModel();
                model.count= CountMap.get(c.id);
                model.classname = c.name;
                models.add(model);
            }
    }

    public class myModel{
        public Integer count{get;set;}
        public String classname{get;set;}
    }
 }