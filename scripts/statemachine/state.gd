extends Node
class_name State

signal Transition

func Enter():
	pass
	
func Exit():
	pass

@warning_ignore("unused_parameter")
func Update(delta):
	pass

@warning_ignore("unused_parameter")	
func Physics_Update(delta):
	pass

func transition(state = "Idle"):
	Transition.emit(state)
