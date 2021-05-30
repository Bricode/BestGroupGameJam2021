extends Spatial

func _process(delta):
	if PlayerInfo.konami_code:
		rotate(Vector3(0,1,0),delta)
		for n in [$OmniLight,$OmniLight2,$OmniLight3,$OmniLight4]:
			n.light_color = Color("3bc70f")
		for n in [$OmniLight5,$OmniLight6]:
			n.light_color = Color("11b7d7")
		for n in [$OmniLight7,$OmniLight8,$OmniLight9,$OmniLight10]:
			n.light_color = Color("c70f99")
