public with sharing class StrategicFSDebtListController {
    
    public static string debtJsonString = '['+
		'  {'+
		'    "id": 1,'+
		'    "creditorName": "CBNA",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 2.00,'+
		'    "balance": 1363.00'+
		'  },'+
		'  {'+
		'    "id": 2,'+
		'    "creditorName": "AMEX",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 2.00,'+
		'    "balance": 2763.00'+
		'  },'+
		'  {'+
		'    "id": 3,'+
		'    "creditorName": "AMEX",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 2.00,'+
		'    "balance": 429.00'+
		'  },'+
		'  {'+
		'    "id": 4,'+
		'    "creditorName": "AMEX",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 2.00,'+
		'    "balance": 1363.00'+
		'  },'+
		'  {'+
		'    "id": 5,'+
		'    "creditorName": "DISCOVERBANK",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 2.00,'+
		'    "balance": 2644.00'+
		'  },'+
		'  {'+
		'    "id": 6,'+
		'    "creditorName": "CAPITAL ONE",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 4.00,'+
		'    "balance": 5464.00'+
		'  },'+
		'  {'+
		'    "id": 7,'+
		'    "creditorName": "CAPITAL ONE",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 4.00,'+
		'    "balance": 2345.00'+
		'  },'+
		'  {'+
		'    "id": 8,'+
		'    "creditorName": "CAPITAL ONE",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 4.00,'+
		'    "balance": 836.00'+
		'  },'+
		'  {'+
		'    "id": 9,'+
		'    "creditorName": "CBNA",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 3.50,'+
		'    "balance": 687.00'+
		'  },'+
		'  {'+
		'    "id": 10,'+
		'    "creditorName": "CBNA",'+
		'    "firstName": "Suman",'+
		'    "lastName": "Tester79",'+
		'    "minPaymentPercentage": 3.50,'+
		'    "balance": 235.00'+
		'  }'+
		']';
    
    @AuraEnabled(cacheable = true)
    public static list<StrategicFSDebtWrapper> onLoadDebtDetails(){
        list<StrategicFSDebtWrapper> listStrategicFSDebt = new list<StrategicFSDebtWrapper>();
        try{
            listStrategicFSDebt = (list<StrategicFSDebtWrapper>) System.JSON.deserialize(debtJsonString, list<StrategicFSDebtWrapper>.class);
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