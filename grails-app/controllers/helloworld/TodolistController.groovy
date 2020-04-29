package helloworld



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TodolistController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Todolist.list(params), model:[todolistInstanceCount: Todolist.count()]
    }

    def show(Todolist todolistInstance) {
        respond todolistInstance
    }

    def create() {
        respond new Todolist(params)
    }

    @Transactional
    def save(Todolist todolistInstance) {
        if (todolistInstance == null) {
            notFound()
            return
        }

        if (todolistInstance.hasErrors()) {
            respond todolistInstance.errors, view:'create'
            return
        }

        todolistInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'todolist.label', default: 'Todolist'), todolistInstance.id])
                redirect todolistInstance
            }
            '*' { respond todolistInstance, [status: CREATED] }
        }
    }

    def edit(Todolist todolistInstance) {
        respond todolistInstance
    }

    @Transactional
    def update(Todolist todolistInstance) {
        if (todolistInstance == null) {
            notFound()
            return
        }

        if (todolistInstance.hasErrors()) {
            respond todolistInstance.errors, view:'edit'
            return
        }

        todolistInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Todolist.label', default: 'Todolist'), todolistInstance.id])
                redirect todolistInstance
            }
            '*'{ respond todolistInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Todolist todolistInstance) {

        if (todolistInstance == null) {
            notFound()
            return
        }

        todolistInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Todolist.label', default: 'Todolist'), todolistInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'todolist.label', default: 'Todolist'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
