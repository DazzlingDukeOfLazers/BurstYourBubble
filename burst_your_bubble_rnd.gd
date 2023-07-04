extends Node2D

@export var mob_scene: PackedScene
var score

@onready var time_start = 0
@onready var time_now = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	time_start = Time.get_ticks_msec()
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_now = Time.get_ticks_msec()
	var time_elapsed = time_now - time_start
	get_node("Hud/Timer").text = str(time_elapsed/1000.0)
	pass


func game_over():
	$game_meta/ScoreTimer.stop()
	$game_meta/MobTimer.stop()

func new_game():
	get_tree().call_group(&"mobs", &"queue_free")
	score = 0
	$Player.start($game_meta/StartPosition)
	get_node("game_meta/StartTimer").start()




func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	time_start = Time.get_ticks_msec()
	
	get_node("game_meta/MobTimer").start()
	get_node("game_meta/ScoreTimer").start()


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("game_meta/MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_player_hit():
	game_over()
	pass # Replace with function body.
