extends Node2D

var introTime = 2

var timer = Timer.new()
var timer2 = Timer.new()

@onready var fishLogo = $fish
@onready var fishButton = $button

func _ready():
	timer.connect("timeout", killthatguy)
	timer.wait_time = introTime
	timer.one_shot = true
	add_child(timer)
	timer.start()
	
func killthatguy():
	var tween = get_tree().create_tween()
	tween.tween_property(fishLogo, "position", Vector2(320, 248), 1.9).set_trans(Tween.TRANS_QUAD)

	timer2.connect("timeout", killitwithabombpleaseihateit)
	timer2.wait_time = 2
	timer2.one_shot = true
	add_child(timer2)
	timer2.start()
	
func killitwithabombpleaseihateit():
	var tween = get_tree().create_tween()
	tween.tween_property(fishButton, "position", Vector2(143, 334), 0.5).set_trans(Tween.TRANS_BACK)

	
func _process(d):
	pass
