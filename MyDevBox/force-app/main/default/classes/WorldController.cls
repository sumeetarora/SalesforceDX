public class WorldController
{
    public List<SelectOption> Countries{get;set;}
    public List<SelectOption> States{get;set;} 

       
    public String selectedCountry {get;set;} 
    public String selectedState {get;set;} 
    Map<String,List<String>> counttyMap ; 

    
    public WorldController()
    {       
              
        Countries = new List<SelectOption>();
        States = new List<SelectOption>(); 
        
        
        countries.add(new selectoption('----None---','----None---'));
        countries.add(new selectoption('India','India'));
        countries.add(new selectoption('US','US'));
        countries.add(new selectoption('Brazil','Brazil'));
        
        
        states.add(new selectoption('----None---','----None---'));
        states.add(new selectoption('----UP---','----UP---'));
        states.add(new selectoption('----MP---','----MP---'));
        states.add(new selectoption('----US1---','----US1---'));
        states.add(new selectoption('----US2---','----US2---'));
        states.add(new selectoption('----BR1---','----BR1---'));
        states.add(new selectoption('----BR2---','----BR2---'));
        
        
        counttyMap = new Map<String,List<String>>();
        counttyMap.put('India', new List<String>{'----UP---','----MP---'} );
        counttyMap.put('US', new List<String>{'----US1---','----US2---'} );
        counttyMap.put('Brazil', new List<String>{'----BR1---','----BR2---'} );
        
        counttyMap.put('----None---', new List<String>{'----None---','----UP---','----MP---','----US1---','----US2---','----BR1---','----BR2---'} );
        
       
    }
    
    Public void DoMapCountryWithStates(){
         
         States = new List<SelectOption>();
         
             For( String stateName : counttyMap.Get(selectedCountry) ){
                states.add(new selectoption(stateName,stateName));
             }
             If(selectedCountry == '----None---')
               selectedState = '----None---';
         //return new Pagereference ('/home/home.jsp');
         
         //return null;
         
    }
    /*
      List<World__c> Worlds;    
    public List<SelectOption> Countries{get;set;}
    public List<SelectOption> States{get;set;} 
    public List<SelectOption> cities{get;set;}
    
    set<string> state;    
    set<string> city;    
       
    public String selectedCountry {get;set;} 
    public String selectedState {get;set;} 
    
    Map<String,set<String>> CountryMap;
    Map<String,set<String>> StateMap;
    
    public WorldController()
    {       
        Worlds = new List<World__C>();  
              
        Countries = new List<SelectOption>();
        States = new List<SelectOption>(); 
        cities = new List<SelectOption>(); 
        countries.add(new selectoption('----none---','----none---'));
        countries.add(new selectoption('----A---','----India---'));
        countries.add(new selectoption('----US---','----US---'));
        
        
        states.add(new selectoption('----A---','----A---'));
        cities.add(new selectoption('----A---','----A---')); 
             
        state = new set<string>();        
        city =new set<string>();
       
        CountryMap = new Map<String,set<String>>();
        StateMap = new Map<String,set<String>>();        
        Worlds = [Select Country__c,State__c,City__c
                  from World__c];
        
        
        for(World__c w : Worlds)
        {
            set<String> StateList= CountryMap.get(w.country__c);
            if(StateList == null)
            {
                StateList = new set<String>();
            }
            StateList.add(w.state__c);
            CountryMap.put(w.country__c,StateList);
            
            set<String> cityList = StateMap.get(w.State__c);
            if(cityList == null)
            {
                cityList = new set<String>();
            }
            cityList.add(w.City__c);
            StateMap.put(w.State__c,cityList);
        }
        for(String country : CountryMap.keyset())
        {
            Countries.add(new SelectOption(country,country));
        }
        }
        public void goToStates()
        {
           state = countryMap.get(selectedCountry);
       
            for(String s : state)
            {
                States.add(new SelectOption(s,s));
            }
        }
        public void goToCities()
        {
            city = stateMap.get(selectedState);
       
            for(String c : city)
            {
                cities.add(new SelectOption(c,c));
            }
        }
        */
              
}