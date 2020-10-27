import {LightningElement, api, track} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Sub_ToDo__c.Name'
import DESCRIPTION_FIELD from '@salesforce/schema/Sub_ToDo__c.Description__c'
import ISDONE_FIELD from '@salesforce/schema/Sub_ToDo__c.IsDone__c'
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class SubToDoCard extends LightningElement {

    descriptionField = DESCRIPTION_FIELD;
    isDoneField = ISDONE_FIELD;
    nameField = NAME_FIELD;
    fields = [NAME_FIELD, DESCRIPTION_FIELD, ISDONE_FIELD];
    isEditForm = false;
    @api subToDo;
    @api recordId;


    handleClickOnEdit() {
        this.switchRecordForm();
    }

    handleClickOnDelete() {
        this.dispatchEvent(new CustomEvent('deletesubtodo', { detail: this.recordId}));
    }

    handleUpdateSubToDo() {
        this.switchRecordForm();
        this.dispatchEvent(new CustomEvent('refreshlist'));
    }

    switchRecordForm() {
        this.isEditForm = !this.isEditForm;
    }

}