extends CharacterBody2D

@export var speed = 200
var character_direction = "idle"
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction[0] < 0:
		#print("left")
		character_direction = "idle_left"
		$AnimatedSprite2D.play("run_left")
	elif input_direction[0] > 0:
		#print("right")
		character_direction = "idle_right"
		$AnimatedSprite2D.play("run_right")
	elif input_direction[1] > 0.9:
		#print("down")
		character_direction = "idle"
		$AnimatedSprite2D.play("run_down")
	elif input_direction[1] < -0.9:
		#print("up")
		character_direction = "idle_up"
		$AnimatedSprite2D.play("run_up")
	else:
		#print(character_direction)
		$AnimatedSprite2D.play(character_direction)
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
