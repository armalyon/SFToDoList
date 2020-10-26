import {LightningElement, api, wire, track} from 'lwc';
import NAME_FIELD from '@salesforce/schema/ToDo__c.Name';
import DESCRIPTION_FIELD from '@salesforce/schema/ToDo__c.Description__c';
import STATUS_FIELD from '@salesforce/schema/ToDo__c.Status__c';
import CATEGORY_FIELD from '@salesforce/schema/ToDo__c.Category__c';
import START_DAY_FIELD from '@salesforce/schema/ToDo__c.Start_Date__c';
import DEADLINE_FIELD from '@salesforce/schema/ToDo__c.Deadline__c';

import {getObjectInfo} from 'lightning/uiObjectInfoApi';
import TODO_OBJECT from '@salesforce/schema/ToDo__c';

export default class EditToDoModal extends LightningElement {

    @api isCreateMode;
    @api todo;
    recordTypeName = 'Personal';
    @track recordTypeId;
    recordTypeIds;


    // @wire(getObjectInfo, {objectApiName: TODO_OBJECT})
    // objectInfo;

    @wire(getObjectInfo, {objectApiName: TODO_OBJECT})
    handleObjectInfo({error, data}) {
        if (data) {
            this.recordTypeIds = data.recordTypeInfos;
            this.recordTypeId = Object.keys(this.recordTypeIds).find(
                rti => this.recordTypeIds[rti].name === this.recordTypeName);
            console.log('Recordtype id= ' + this.recordTypeId);
        }
    }

    fields = [NAME_FIELD, DESCRIPTION_FIELD, STATUS_FIELD, CATEGORY_FIELD,
        START_DAY_FIELD, DEADLINE_FIELD];

    handleSave() {
        this.dispatchEvent(new CustomEvent('closemodal'));
    }

    handleCancel() {
        this.dispatchEvent(new CustomEvent('closemodal'));
    }

    get view() {
        if (this.todo.Id == null) {
            return 'edit';
        } else {
            return 'view';
        }
    }

    get radioOptions() {
        return [
            {label: 'Personal', value: 'Personal'},
            {label: 'Work', value: 'Work'},
        ];
    }

    changeRecordTypeName(event) {
        this.recordTypeName = event.detail.value;
        this.recordTypeId = Object.keys(this.recordTypeIds).find(
            rti => this.recordTypeIds[rti].name === this.recordTypeName);
        console.log('Recordtype id= ' + this.recordTypeId);
    }

}