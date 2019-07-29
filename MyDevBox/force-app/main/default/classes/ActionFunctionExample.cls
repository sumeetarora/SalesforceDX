public with sharing class ActionFunctionExample {

    


    public List<SelectOption> listvalues { get; set; }
    
    
    
    public String selectvalue { get; set; }
    public String selectval { get; set; }
    
    Public ActionFunctionExample(){
        selectval = 'A';
        listvalues = new List<SelectOption>();
        listvalues.add(new selectOption('A','A'));
        listvalues.add(new selectOption('B','B'));
        listvalues.add(new selectOption('C','C'));
        system.debug('in constructor');
    }
    
    
    Public string getselectedval(){
        //System.debug('#in renderField');
        //System.debug(selectvalue);
        selectval = selectvalue;
        return null;
    }
}