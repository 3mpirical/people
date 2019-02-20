# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Performance.destroy_all()
Person.destroy_all()

for i in (0..19)
    Person.create(
        name: Faker::TvShows::RuPaul.queen(),
        age: Faker::Number.number(2),
        hair_color: Faker::Color.color_name(),
        eye_color: Faker::Color.color_name(),
        gender: Faker::Gender.type(),
        alive: Faker::Boolean.boolean() ,
    )
end

Person.all().each() {|queen|
    for i in (0..3)
        Performance.create(
            person_id: queen.id, 
            location: Faker::Games::SuperSmashBros.stage,
            date: Faker::Date.forward(35),
            time: "When I Start!",
        )
    end
}

puts "__________ QUEENS CREATED __________"
Person.all().each_with_index() {|queen, index|
    puts "_____Queen: #{index}_____"
    puts "Name: #{queen.name}"
    puts "Age: #{queen.age}"
    puts "Hair Color: #{queen.hair_color}"
    puts "Eye Color: #{queen.eye_color}"
    puts "Gender: #{queen.gender}"
    puts "Alive: #{queen.alive}"
    puts ""
    queen.performances.each() {|performance|
        puts "  Performance:"
        puts "  Location: #{performance.location}"
        puts "  Date: #{performance.date}"
        puts ""
    }
}
