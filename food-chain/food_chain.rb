class FoodChain
  VERSION = 2

  class << self
    def song
      song = start_song
      animals_eaten = ["fly"]

      %w[spider bird cat dog goat cow].each do |animal|
        song << old_lady_swallowed(animal) + what_happened_with(animal)
        animals_eaten.unshift animal

        animals_eaten.each_cons(2) do |animals|
          predator, prey = animals
          song << swallowed_to_catch(predator, prey)
        end

        song << dont_know_why_swallowed_fly
      end

      song << end_song
    end

    private

    def start_song
      old_lady_swallowed("fly") + dont_know_why_swallowed_fly
    end

    def end_song
      old_lady_swallowed("horse") + dead
    end

    def old_lady_swallowed(animal)
      "I know an old lady who swallowed a #{animal}.\n"
    end

    def dont_know_why_swallowed_fly
      "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
    end

    def what_happened_with(animal)
      send "what_happened_with_#{animal}"
    end

    def what_happened_with_spider
      "It wriggled and jiggled and tickled inside her.\n"
    end

    def what_happened_with_bird
      "How absurd to swallow a bird!\n"
    end

    def what_happened_with_cat
      "Imagine that, to swallow a cat!\n"
    end

    def what_happened_with_dog
      "What a hog, to swallow a dog!\n"
    end

    def what_happened_with_goat
      "Just opened her throat and swallowed a goat!\n"
    end

    def what_happened_with_cow
      "I don't know how she swallowed a cow!\n"
    end

    def swallowed_to_catch(predator, prey)
      response = "She swallowed the #{predator} to catch the #{prey}"
      response << rest_of_verse(prey)
    end

    def rest_of_verse(prey)
      prey == "spider" ? " that wriggled and jiggled and tickled inside her.\n" : ".\n"
    end

    def dead
      "She's dead, of course!\n"
    end
  end
end
