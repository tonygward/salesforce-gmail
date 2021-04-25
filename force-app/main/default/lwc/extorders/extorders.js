/*eslint no-console: “error”*/

import { LightningElement, api, wire } from 'lwc';
import getOrderDetails from '@salesforce/apex/extordersController.getOrderDetails';

const orderDetailColumns = [    
    { label: 'Order Id', fieldName: 'orderID__c' },
    { label: 'Quantity', fieldName: 'quantity__c' },
    { label: 'Unit Price', fieldName: 'unitPrice__c' },
]

export default class Extorders extends LightningElement {
    @api recordId;

    orderDetailColumns = orderDetailColumns;        
    
    orderDetails;    
    @wire(getOrderDetails, { orderId : 1044 })
    wiredOrderdetails({ error, data}) {             
        if (data) {
            this.orderDetails = data;
            this.error = undefined;
        } else if (error) {
            this.orderDetails = undefined;
            this.error = error;
        }
    }
}