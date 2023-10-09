import { LightningElement, wire, api, track } from 'lwc';
import getDebtDataList from '@salesforce/apex/StrategicFSDebtListController.onLoadDebtDetails';

const debtDataColumns = [
    { label: 'Creditor Name', fieldName: 'creditorName', editable: true },
    { label: 'First Name', fieldName: 'firstName', type: 'string', editable: true },
    { label: 'Last Name', fieldName: 'lastName', type: 'string', editable: true },
    { label: 'Min Payment %', fieldName: 'minPaymentPercentage', type: 'decimal', editable: true },
    { label: 'Balance', fieldName: 'balance', type: 'currency', editable: true },
];

export default class StrategicFSDebtList extends LightningElement {
    @api recordId;
    @track totalBalance;
    @track totalRecords;
    @track jsonDebtSelectedList = [];
    @track selectedRows = 0;
    @track draftValues;

    debtData = [];
    debtDataColumns = debtDataColumns;

    @wire(getDebtDataList)
    dataFn({data, error}){
        this.debtData = data;
        this.calculateData(this.debtData);
    }

    //this is called when any of the row is marked checked
    handleRowSelection(event){
        const selectedRows = event.detail.selectedRows;
        this.selectedRows = selectedRows.length;
        this.jsonDebtSelectedList = selectedRows;
    }

    //Calculating Total balacne and Records
    calculateData(debtData){
        this.totalBalance = 0;
        this.totalRecords = 0;
        if(this.debtData){
            this.debtData.forEach(eachData =>{
                this.totalRecords = this.totalRecords + 1;
                this.totalBalance = this.totalBalance + parseFloat(eachData.balance);
            });
        }
    }
   
    // Adding new instance of Row
    handleAddDebt() {
        const newDebtRow ={'creditorName':'','firstName':'','lastName':'','minPaymentPercentage':0,'balance':0}; 
        this.debtData = [...this.debtData, newDebtRow];
	}

    // Saving the data in JSON
    handleSave(event){
        console.log(JSON.stringify(event.detail.draftValues));
        const newDebtRow = JSON.parse(JSON.stringify(event.detail.draftValues));
        this.debtData.pop();
        this.debtData = [...this.debtData, newDebtRow[0]];
        this.calculateData(this.debtData);
        this.draftValues = null;
    }

    // Removing selected elements from the list
    handleClickRemove(event){
        this.jsonDebtSelectedList.forEach(element => {
            if(this.debtData.length > 1){
                this.debtData = this.debtData.filter(function (each) {
                    return each.id !== element.id;
                });
            }
            else if(this.debtData.length == 0){
                this.debtData = [];
            }
        });
        this.calculateData(this.debtData);
    }

}
