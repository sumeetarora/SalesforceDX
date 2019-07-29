public class InlineVFcontroller{

    public contact con{get;set;}
    public attachment att{get;set;}
    public attachment at{get;set;}
    public string name {get;set;}
    
    public InlineVFcontroller(ApexPages.standardcontroller ob){
        con= new contact();
        con=(contact)ob.getrecord();
        att = new attachment();
        at = [select id from attachment where parentid =: con.id order by id desc limit 1  ];
        name = '/servlet/servlet.FileDownload?file=' +at.id;
        
    }
    
    public void save(){
        att.parentid= con.id;
        insert att;
    }
}