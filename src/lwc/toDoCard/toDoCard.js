import {LightningElement, api} from 'lwc';

export default class ToDoCard extends LightningElement {
  @api todo;

  isOpenEditModal = false;
  showExpandBody = false;

  handleClickOnDelete() {
    const deleteEvent = new CustomEvent('deletetodo', {
      detail: this.todo.Id
    });
    this.dispatchEvent(deleteEvent);
  }

  handleClickOnEdit() {
    this.isOpenEditModal = true;
  }

  get styleBack() {
    if (this.todo.Status__c === 'Done') {
      return `background-color: blue`;
    }
  }

  closeEditModal() {
    this.isOpenEditModal = false;
    this.dispatchEvent(new CustomEvent('refreshlist'));
  }

  showExpandOrCollapsed() {
    this.showExpandBody = !this.showExpandBody;
  }

}