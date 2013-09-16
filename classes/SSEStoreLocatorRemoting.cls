global with sharing class SSEStoreLocatorRemoting
{
    

    @RemoteAction
    global static void saveConfig(String bgCustom,String headerCustom,String markerCustom,String footerCustom) {
        
        Store_Locator_Config__c slcRec = [select id from Store_Locator_Config__c where name ='Store Locator Info'];
        Store_Locator_Config__c slc = new Store_Locator_Config__c(id=slcRec.id);
        slc.Background__c = bgCustom;
        slc.Header__c = headerCustom;
        slc.Map_Marker__c = markerCustom;
        slc.Footer__c = footerCustom;
        
        update slc;
    }
}