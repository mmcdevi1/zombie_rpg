require 'pry'
require './hero.rb'
require './zombie.rb'
require './inventory.rb'
require './item.rb'

class ZombieAdventure
	attr_accessor :hero, :zombie, :inventory

	CHOICES = ['a', 'd', 'e', 'exit']

	def initialize
		@hero      = Hero.new(100, 50)
		@zombie    = Zombie.new(100, 90)
		@inventory = []
		play
	end

	def welcome_message
		puts ""
		puts "You wake up in a dark empty room in an abandon house!"
		puts "You have no memory of anything. You don't even know your name."
		puts ""
		sleep(2)
		5.times do
	    print "."
	    sleep(rand(0.1..1.0))
	  end
	  puts ""
	  puts ""
	  puts "You find a flashlight, turn it on, and find an elixir worth 50 hp."
	  print "Do you pick it up? (y/n) "
	  answer = gets.chomp.downcase
	end

	def heros_name
		print "Print the hero's name: "
		hero.name = gets.chomp.downcase
		divider
		puts "#{hero.name.capitalize}, you must defeat #{zombie.name} before he eats you!"
	end

	def damage_points(player)
		player.strength * rand(1..100)/100.to_f
	end

	def fight
		while true
			divider
			puts "#{zombie.name} is approacing you fast. What do you do?"
			begin
	      puts "Choose an option: "
	      divider
	      puts "Press 'a' to attack"
	      puts "Press 'd' to dodge"
	      puts "Press 'e' or 'exit' to exit"
	      divider
	      print "Enter your choice: "
	      input = gets.chomp.downcase
	    end until CHOICES.include?(input)
	    case input
	    when 'a'
	    	attack_points = damage_points(hero)
	    	zombie_attack = damage_points(zombie)
	    	puts "You attacked #{zombie.name} with #{attack_points} damage points!"
	    	puts "#{zombie.name} roaaars at you in anger!"
	    	zombie.hp -= attack_points
	    	puts "#{zombie.name} now has #{zombie.hp} hp"
	    	puts "#{zombie.name} attacked you with #{zombie_attack}"
	    	hero.hp -= zombie_attack
	    	puts "You now have #{hero.hp} hp"
	    	if hero.hp <= 0 || zombie.hp <= 0
	    		puts "GAME OVER! You died!"
	    		break
	    	end
	    end
	  end
	end

	def divider
    puts "=" * 70
  end

	def play
		welcome_message
		fight
	end
end

ZombieAdventure.new















































