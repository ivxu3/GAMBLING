extends Node2D

# Assigns a rarity tier a number. A higher number means it is more common.
var rarities = {"Common": 1410,
				"Rare": 470,
				"Epic": 102,
				"Legendary": 12,
				"Mythical": 6}

# Initializes RNG instance
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in 100:
		print(get_rarity())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func get_rarity():
# Generates a randomized seed based on your OS time??
	rng.randomize()
	
	var weighted_sum = 0
	
	for n in rarities:
# Makes a variable to store the sum of the weights of all rarities
		weighted_sum += rarities[n]

# Generates a random number from 0 to the maximum weight
	var item = rng.randi_range(0, weighted_sum)

# Subtracts the random number if it is above the weight of the rarity and moves onto the higher rarity
	for n in rarities:
		if item <= rarities[n]:
			return n
		item -= rarities[n]
