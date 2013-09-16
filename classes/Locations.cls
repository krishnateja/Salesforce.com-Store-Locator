public with sharing class Locations {

    public boolean check1 { get; set; }
    public boolean check2 { get; set; }
    public boolean visit1{get;set;}
    public String select1{get;set;}
    public List<Store_Location__c > acc{get;set;}    
    public superItemMap[] dataSet {get;set;}
    public String imgURL;
    public List<SelectOption> options{get;set;}
    
    Public String Country{set;get;}
    Public String City{set;get;}
    Public String State{set;get;}
    
    Public String header{set;get;}
    Public String footer{set;get;}
    Public String marker{set;get;}
    Public String bg{set;get;}
    
    Public String headerCustom{set;get;}
    Public String footerCustom{set;get;}
    Public String markerCustom{set;get;}
    Public String bgCustom{set;get;}
    public String dynaQuery{set;get;}
    
    Public List<Store_Location__c> sl{set;get;}
    
    public Locations (){
        try{
            dataSet = new superItemMap[]{};        
            imgURL = 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|99fe35|000000';
            
            acc =[select Name,State__c,City__c,Street__c,Zip_Code__c,ID From Store_Location__c limit 3];
            
            for(Store_Location__c c: acc) {
                dataSet.add(new superItemMap(c.Name, imgURL,c.Street__c, c.City__c, c.State__c, c.Zip_Code__c, c.Id));
            }
            
            Store_Locator_Config__c myCS1 = Store_Locator_Config__c.getValues('Store Locator Info');
            marker = myCS1.Map_Marker__c;
            header = myCS1.Header__c;
            footer = myCS1.Footer__c;
            bg = myCS1.Background__c;
        }catch(Exception e){
        }
        
    }
    
    public class superItemMap{
        public String iName {get;set;}
        public String Marker {get;set;}
        public String iType{get;set;}
        public String BillingStreet {get;set;}
        public String BillingCity {get;set;}
        public String BillingState {get;set;}
        public String BillingZip {get;set;}
        public String iID {get;set;}
        public superItemMap(String n, String m, String BS, String BC, String BSt, String BZ, String i) {
            iName = n;
            Marker = m;            
            BillingStreet = BS;
            BillingCity = BC;
            BillingState = BSt;
            BillingZip = BZ;
            iID = i;
            
        }
        
        
    
    }
    public void getDistance(){ 
    dynaQuery = 'select Name,State__c,City__c,Street__c,Zip_Code__c,ID From Store_Location__c';
            try{ 
                if(country!=null || state!=null || city!=null){             
                     dynaQuery+=' where ';
                     if(Country!=''){             
                         dynaQuery+='Name=\''+country+'\'';             
                     }
                    if( State!=''){              
                     dynaQuery+=' OR State__c=\''+state+'\'';             
                    }
                    
                    if(city!=''){
                        dynaQuery+=' OR city__c=\''+city+'\'';
                    }
                    //dynaQuery+=';';
                }
                 system.debug('Query is'+dynaQuery);
                 sl = Database.query(dynaQuery);                     
                 System.debug('Select1 is'+select1); 
             }catch(Exception e){
             
             }          
    }
    public List<SelectOption> getOpt(){
         options  =new List<SelectOption>();
         options.add(new SelectOption('2','2kms'));
         options.add(new SelectOption('5','5kms'));
         options.add(new SelectOption('10','10kms'));
         options.add(new SelectOption('20','20kms'));
         options.add(new SelectOption('2000','2000kms'));
         
         return options;
    }  
    
        
}