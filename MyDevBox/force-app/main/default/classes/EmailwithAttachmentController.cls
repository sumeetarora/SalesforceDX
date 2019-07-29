public class EmailwithAttachmentController{
    
    public attachment att{get;set;}
    public contact s{get;set;}
    public EmailwithAttachmentController(){
        s= new contact();
        att = new attachment();
    }
    public void save(){
        insert s;
        contact st = [Select id from contact order by id desc limit 1];
        att.parentid = st.id;
        insert att;
       
        
         attachment at = [select id,body from attachment where parentid =:st.id ];
         
        String n=  '/servlet/servlet.FileDownload?file='+at.id;
        //For Attachment
       List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
       Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
        
        efa.setFileName('My attachment.jpg');
        efa.setBody(at.body);
        fileAttachments.add(efa);
        //For Email send
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('iBirds College');
       // mail.setPlainTextBody('Testing <strong>Mail</strong>');
        mail.setHtmlBody('Testing <strong>Mail</strong>');
        mail.setToAddresses(new List<String>{'sumeetsalesforce@gmail.com'});
        mail.setFileAttachments(fileAttachments);
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});

    }
}