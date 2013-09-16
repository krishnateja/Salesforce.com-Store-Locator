@isTest
public class testStoreLocator{
    static testMethod void myTest() {
    User u1 = [SELECT Id FROM User WHERE Alias='KKarn'];
    System.RunAs(u1){
    
        String bgCustom = 'https://c.ap1.content.force.com/servlet/servlet.ImageServer?id=01590000001WweB&oid=00D90000000lf3I&lastMod=1372669875000';
        String headerCustom = 'https://c.ap1.content.force.com/servlet/servlet.ImageServer?id=01590000001Wwek&oid=00D90000000lf3I&lastMod=1372670071000';
        String markerCustom = 'https://maps.google.com/mapfiles/kml/shapes/library_maps.png';
        String footerCustom = '#1e8c2c';
        
        Store_Locator_Config__c slc = new Store_Locator_Config__c();
        slc.name ='Store Locator Info';
        slc.Background__c = bgCustom;
        slc.Header__c = headerCustom;
        slc.Map_Marker__c = markerCustom;
        slc.Footer__c = footerCustom;
        
        insert slc;
        
        SSEStoreLocatorRemoting.saveConfig(bgCustom,headerCustom,markerCustom,footerCustom);
        
        Locations l = new Locations();
        l.country = 'India';
        l.State = 'Andhra Pradesh';
        l.city = 'Hyderabad';
        
        l.getDistance();
        List<SelectOption> test =  l.getOpt();
        
        
    
    }
    
    }

}