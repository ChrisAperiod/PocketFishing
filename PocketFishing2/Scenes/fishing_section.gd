extends Node2D

@onready var fishBar = $UI/ProgressBar
@onready var catchButton = $UI/CatchButton

@onready var theradiance = $sun

var depletion_rate = 0.05
var ddd = 0.0

var popping = false

var odds = 0
var alltoasters = 0


var fish_numbers : int = 0


var fish_inventory = []


func _process(d):
	ddd += depletion_rate
	alltoasters += 1
	fishBar.value = ddd
	
	odds = randi_range(0,5)
	
	if odds == 5 and alltoasters % 2 == 0 and not popping:
		button_pop()
	
	theradiance.position.y += 1
func _ready():
	randomize()
	pass
	
func button_pop():
	popping = true
	var tween = get_tree().create_tween()
	tween.tween_property(catchButton, "scale", Vector2(0.5, 0.5), 2).set_trans(Tween.TRANS_SINE)
	




func get_fish():
	
	fish_numbers += 1


func _on_catch_button_pressed() -> void:
	var random_fish = FishIndex.fish_names.pick_random()
	get_fish()
	fish_inventory.push_front(random_fish)
	print(fish_numbers)
	print(fish_inventory)
