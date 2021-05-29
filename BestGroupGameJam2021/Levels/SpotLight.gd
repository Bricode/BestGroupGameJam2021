extends SpotLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if((rand_range(0,100) < 99) && (counter == 0)): 
		hide()
		
	else:
		#light_color = Color8(rand_range(0,255), rand_range(0,255),rand_range(0,255))
		show()
		counter+= 1
		
	if (counter == 50):
		counter = 0
	
	
	
