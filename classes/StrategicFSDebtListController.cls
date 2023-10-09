/*
*********************************************************
Apex Class Name    : StrategicFSDebtListController
Created Date       : Oct 09, 2023
@description       : This is class is used retrieving Debt specific data from git and  pass it to LWC
@author            : Abhijeet
Modification Log:
Ver   Date         Author                               Modification
1.0   10-09-2023   Abhijeet                      		Initial Version
*********************************************************
*/
public with sharing class StrategicFSDebtListController {
    
    @AuraEnabled(cacheable = true)
    public static list<StrategicFSDebtWrapper> onLoadDebtDetails(){
        list<StrategicFSDebtWrapper> listStrategicFSDebt = new list<StrategicFSDebtWrapper>();
        try{
			HttpRequest req = new HttpRequest();
			req.setEndpoint('https://raw.githubusercontent.com/StrategicFS/Recruitment/master/data.json');
			req.setMethod('GET');
			Http http = new Http();
			HTTPresponse res= http.send(req);
			string response = res.getBody();	
            listStrategicFSDebt = (list<StrategicFSDebtWrapper>) System.JSON.deserialize(response, list<StrategicFSDebtWrapper>.class);
            return listStrategicFSDebt;
        }
        catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }
    
    public class StrategicFSDebtWrapper {
        @AuraEnabled
        public Integer id {get; set;}
        @AuraEnabled
		public String creditorName {get; set;}
        @AuraEnabled
		public String firstName {get; set;}
        @AuraEnabled
		public String lastName {get; set;}
        @AuraEnabled
		public Decimal minPaymentPercentage {get; set;}
        @AuraEnabled
		public Decimal balance {get; set;}
	}

}
