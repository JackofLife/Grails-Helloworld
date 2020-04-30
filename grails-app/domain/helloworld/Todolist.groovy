package helloworld

class Todolist {

    Date   dateCreated = new Date()
    String description
    String name
    String sharing

    static constraints = {
        description nullable: true
        sharing inList: ['public', 'private']
    }
}
