import {createElement} from 'lwc'
import StrategicFSDebtList from 'c/StrategicFSDebtList'; // Replace with your component's import path
import { registerApexTestWireAdapter } from '@salesforce/sfdx-lwc-jest';
import getDebtDataList from '@salesforce/apex/StrategicFSDebtListController.onLoadDebtDetails';
// Mock data for debtData
const mockDebtData = [
    { id: '1', creditorName: 'Creditor 1', firstName: 'John', lastName: 'Doe', minPaymentPercentage: 5, balance: 1000 },
    { id: '2', creditorName: 'Creditor 2', firstName: 'Jane', lastName: 'Smith', minPaymentPercentage: 4, balance: 800 },
];



// Register the Apex wire adapter
const getDebtDataListAdapter = registerApexTestWireAdapter(getDebtDataList);
describe('c-strategic-fs-debt-list', () => {
    let element;
    beforeEach(() => {
        // Create a new instance of the component
        element = createElement('c-strategic-fs-debt-list', {
            is: StrategicFSDebtList,
        });
        document.body.appendChild(element);
        // Simulate the Apex wire response
        getDebtDataListAdapter.emit(mockDebtData);
    });
    afterEach(() => {
        // Remove the component from the DOM
        document.body.removeChild(element);
        // Clear mocks after each test
        jest.clearAllMocks();
    });
    it('renders with mock data', () => {
        // Verify that the component renders
        const cardElement = element.shadowRoot.querySelector('lightning-card');
        expect(cardElement).not.toBeNull();
        // Add more specific assertions for rendering as needed
    });
    it('handles row selection', () => {
        // Simulate row selection event
        const rowSelectionEvent = new CustomEvent('rowselection', {
            detail: { selectedRows: [mockDebtData[0]] },
        });
        element.shadowRoot.querySelector('lightning-datatable').dispatchEvent(rowSelectionEvent);
        // Verify that selectedRows property is updated
        expect(element.selectedRows).not.toEqual([mockDebtData[0]]);
    });
    it('calculates total balance and records', () => {
        // You can add assertions to test the calculateData method here
    });
    it('renders the component', () => {
        // Ensure that the component is rendered
        const cardElement = element.shadowRoot.querySelector('lightning-card');
        expect(cardElement).not.toBeNull();
        // You can add more specific assertions for elements within the component here
    });
    it('handles add debt button click', () => {
        // Simulate a click on the "Add Debt" button
        const addButton = element.shadowRoot.querySelector('lightning-button[title="Add Debt"]');
        addButton.click();
        // Add your assertions for what should happen when the button is clicked
    });
    it('handles remove debt button click', () => {
        // Simulate a click on the "Remove Debt" button
        const removeButton = element.shadowRoot.querySelector('lightning-button[title="Remove Debt"]');
        removeButton.click();
        // Add your assertions for what should happen when the button is clicked
    });
})