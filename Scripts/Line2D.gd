extends Line2D

@export var speed = 0.6
#var player: Node2D = null
@onready var player = get_node("/root/Game/bunny")
var num_segments: int = 10
var segment_length: int = 10
var starting_pos: Vector2 = Vector2(0, 300)

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in num_segments:
		add_point(Vector2(starting_pos.x + (i * segment_length), starting_pos.y + (i * segment_length)))

# Called every frame. 'delta' is the elapsed time since the previous frame. func process(_delta):
func _process(_delta):
	var point_count = get_point_count()
	#attack player
	if player:
		var head_pos = get_point_position(0)
		var direction = (player.global_position - head_pos).normalized()
		var new_head_pos = head_pos + (direction * speed)
		set_point_position(0, new_head_pos)
	for i in point_count:
		if i == 0:
			continue
		if abs((get_point_position(i-1) - get_point_position(i)).length()) > segment_length:
			var next_point = get_point_position(i-1) - (get_point_position(i).direction_to(get_point_position(i-1))*segment_length)
			set_point_position(i, next_point)
	


func _draw():
	for i in get_point_count():
		var point_position: Vector2 = get_point_position(i) 
		draw_circle(point_position, get_point_count()-i+4, Color.ORANGE_RED)
