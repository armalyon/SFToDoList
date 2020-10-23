import {LightningElement, api, track} from 'lwc';
import {deleteRecord} from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getToDoById from '@salesforce/apex/ToDoController.getToDoById'

export default class ToDoCard extends LightningElement {
    @api recordId;
    @track name;
    @track description;
    @track category;
    @track startDate;
    @track deadline;
    @track status;

    @track isOpenEditModal = false;

    connectedCallback() {
        this.loadRecord();
    }


    handleClickOnDelete() {
        deleteRecord(this.recordId).then(() => {
                const event = new ShowToastEvent({
                    title: 'Deleted',
                    variant: 'success',
                    mode: 'dismissable'
                });
                this.dispatchEvent(event);
            }
        ).catch(error => {
            console.log(error);
            const event = new ShowToastEvent({
                title: 'Error occurred',
                variant: 'error',
                mode: 'dismissable'
            });
            this.dispatchEvent(event);
        });
        this.dispatchEvent(new CustomEvent('recordscountupdated'));
    }

    handleClickOnEdit() {
        this.isOpenEditModal = true;
    }

    closeEditModal() {
        this.isOpenEditModal = false;

    }


    loadRecord() {
        getToDoById({recordId: this.recordId}).then(result => {
                this.name = result.Name;
                this.description;
                this.category;
                this.startDate;
                this.deadline;
                this.status;
            }
        )
    }

}