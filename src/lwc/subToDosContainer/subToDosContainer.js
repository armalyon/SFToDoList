import {LightningElement, api, wire} from 'lwc';
import getSubToDoListByParentToDoId from '@salesforce/apex/SubToDoController.getSubToDoListByParentToDoId'
import {ShowToastEvent} from "lightning/platformShowToastEvent";
import {reduceErrors} from 'c/ldsUtils';
import {refreshApex} from "@salesforce/apex";
import {deleteRecord} from "lightning/uiRecordApi";
import NAME_FIELD from '@salesforce/schema/Sub_ToDo__c.Name'
import DESCRIPTION_FIELD from '@salesforce/schema/Sub_ToDo__c.Description__c'
import TODO_FIELD from '@salesforce/schema/Sub_ToDo__c.ToDo__c'


export default class SubToDosContainer extends LightningElement {


    @api toDoId;
    subToDos;
    wiredResult;
    isCreateMode = false;
    toField = TODO_FIELD;
    descriptionField = DESCRIPTION_FIELD;
    nameField = NAME_FIELD;

    renderedCallback() {
      return this.refreshList();
    }

    @wire(getSubToDoListByParentToDoId, {toDoId: '$toDoId'})
    loadRecords(result) {
        this.wiredResult = result;
        if (result.data) {
            this.subToDos = result.data;
            this.error = undefined;
        } else if (result.error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: reduceErrors(result.error).join(', '),
                    variant: 'error'
                })
            );
        }
    }

    refreshList() {
        return refreshApex(this.wiredResult);
    }

    handleDeleteSubToDo(event) {
        const subToDoId = event.detail;

        deleteRecord(subToDoId)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Sub-Todo deleted',
                        variant: 'success'
                    })
                );
            })
            .catch((error) => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting todo',
                        message: reduceErrors(error).join(', '),
                        variant: 'error'
                    })
                );
            }).finally(() => {
            this.refreshList();
        });

    }

    handleClickCreateSubTodo() {
        if (!this.isCreateMode) {
            this.isCreateMode = !this.isCreateMode;
        }
    }

    handleCancelCreateSubToDo() {
        this.isCreateMode = false;
    }

    handleCreateSubToDo() {
        this.isCreateMode = false;
        this.refreshList();
    }

}