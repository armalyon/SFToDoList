import {LightningElement, track} from 'lwc';
import getToDoList from '@salesforce/apex/ToDoController.getToDoList'
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ToDosContainer extends LightningElement {


    @track records;

    connectedCallback() {
        this.loadRecords();
    }


    loadRecords() {
        console.log('load records invoked');
        getToDoList().then(result => {
            this.records = result;
            console.log(this.records);
        }).catch(error => {
            console.log(error);
            const event = new ShowToastEvent({
                title: 'Error occurred',
                variant: 'error',
                message: error,
                mode: 'dismissable'
            });
            this.dispatchEvent(event);
        })
    }


}