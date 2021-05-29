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
	
	if (PlayerInfo.konami_code == false) :
		if((rand_range(0,100) < 99) && (counter == 0)):
			hide()		
		else:		
			show()
			counter+= 1		
		if (counter == 50):
			counter = 0
	else :
		if(rand_range(0,100) < 50):
			show()
			light_color = Color8(rand_range(0,255), rand_range(0,255),rand_range(0,255))
		else:
			hide()	
	
	
	
