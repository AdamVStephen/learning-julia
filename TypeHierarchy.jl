# Type Hierarchy Exercise
#
# Demonstration of multiple dispatch as opposed to conditional formatting

#module LJtypeHierarchy

abstract type AbstractPerson end

struct Person <: AbstractPerson
    name::String
end

struct Student <: AbstractPerson
    name::String
    grade::Int
end

struct GroupLeader <: AbstractPerson
    name::String
    group::String
end

#end

println("Hello World")

adam = Person("adam")
println("$(adam.name) is a Person")
cameron = Student("cameron", 95)
john = GroupLeader("John", "CDAS")

person_info(p::Person) = println("$(p.name) is a Person")
person_info(p::Student) = println("$(p.name) is a Student with grade $(p.grade)")
person_info(p::GroupLeader) = println("$(p.name) is a GroupLeader of $(p.group)")

people = (adam, cameron, john)


for person in people
    person_info(person)
end
