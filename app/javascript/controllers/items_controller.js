import ApplicationController from './application_controller'

export default class extends ApplicationController {

  async remove(e) {
    e.preventDefault();

    if (confirm("Delete invoice item") ) {
      this.element.classList.remove("delete")
      this.element.classList.add("is-loading")

      await this.stimulate('Item#delete', this.element)
    }
  }

}
