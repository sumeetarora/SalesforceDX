trigger OnNewStudentCreation on NewStudent__c (after insert) {
    List <NewStudent__c> n = new List<NewStudent__c>();
    if(Trigger.isAfter){
        n = Trigger.new;
        for(NewStudent__c n1:n){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String[] {'khemani.apurva@gmail.com'}; 
        String[] ccAddresses = new String[] {'sumeetsalesforce@gmail.com'};
          
        
        // Assign the addresses for the To and CC lists to the mail object.
        mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        
        // Specify the address used when the recipients reply to the email. 
        mail.setReplyTo('noreply@gmail.com');
        
        // Specify the name used as the display name.
        mail.setSenderDisplayName('Salesforce support');
        
        // Specify the subject line for your email address.
        mail.setSubject('New student has been generated : ' + n1.SName__c);
        
        // Set to True if you want to BCC yourself on the email.
        mail.setBccSender(false);
        
        // Optionally append the salesforce.com email signature to the email.
        // The email address of the user executing the Apex Code will be used.
        mail.setUseSignature(false);
        
        // Specify the text content of the email.
        mail.setPlainTextBody('Your new student name: ' + n1.SName__c +' has been created.');
        
        
        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }    
    }
            
  }