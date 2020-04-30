package helloworld



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TodolistController {

    static scaffold = true 

}
