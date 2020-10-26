import {LightningElement, api} from 'lwc';

export default class ToDoCard extends LightningElement {
  @api todo;

  isOpenEditModal = false;
  showExpandBody = false;

  handleClickOnDelete() {
    console.log('log from card: ' + this.todo.Id)
    const deleteEvent = new CustomEvent('deletetodo', {
      detail: this.todo.Id
    });
    this.dispatchEvent(deleteEvent);
  }

  handleClickOnEdit() {
    this.isOpenEditModal = true;
  }

  closeEditModal() {
    this.isOpenEditModal = false;
    this.dispatchEvent(new CustomEvent('refreshlist'));
  }

  showExpandOrCollapsed() {
    this.showExpandBody = !this.showExpandBody;
  }

}