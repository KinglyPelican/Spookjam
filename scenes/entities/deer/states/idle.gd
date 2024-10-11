extends State

@export var deer : Deer = null

@export var wander_speed : float = 2.5

var wander_direction : Vector3 = Vector3(0, 0, 1)
var wander_time : float = 3

var new_direction : float = 0

func Enter():
	pass
	
func Exit():
	pass
	
func Update(delta):
	if wander_time <= 0:
		randomize_wander()
	else:
		wander_time -= delta

func Physics_Update(delta):
	if deer:
		deer.rotation.y = lerp_angle(deer.rotation.y, new_direction, 0.1)
		var new_velocity = (deer.transform.basis * Vector3(wander_speed, 0, 0)).normalized()
		deer.velocity.x = new_velocity.x
		deer.velocity.z = new_velocity.z

func randomize_wander():
	new_direction = deg_to_rad(randf_range(0, 360))
	wander_time = randf_range(3.0, 6.0)
