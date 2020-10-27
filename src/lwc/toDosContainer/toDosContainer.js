import {LightningElement, wire} from 'lwc';

import getToDoList from '@salesforce/apex/ToDoController.getToDoList'
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {deleteRecord} from "lightning/uiRecordApi";
import {refreshApex} from "@salesforce/apex";
import {reduceErrors} from 'c/ldsUtils';

export default class ToDosContainer extends LightningElement {

    todos;
    todo = {"Id": null};
    wiredTodosResult;
    isOpenCreateModal = false;

    @wire(getToDoList)
    loadRecords(result) {
        this.wiredTodosResult = result;
        if (result.data) {
            this.todos = result.data;
            this.error = undefined;
        } else if (result.error) {
            this.error = result.error;
            this.todos = undefined;
        }
    }

    connectedCallback() {
        this.refreshList();
    }

    handleDeleteTodo(event) {
        const todoId = event.detail;
        deleteRecord(todoId)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Todo deleted',
                        variant: 'success'
                    })
                );
                return refreshApex(this.wiredTodosResult);
            })
            .catch((error) => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting todo',
                        message: reduceErrors(error).join(', '),
                        variant: 'error'
                    })
                );
            });
    }

    refreshList() {
        return refreshApex(this.wiredTodosResult);
    }

    handleClickCreateTodo() {
        this.isOpenCreateModal = true;
    }

    closeCreateModal() {
        this.isOpenCreateModal = false;
        return this.refreshList();
    }
}