shader_type canvas_item;

uniform float SCREEN_HEIGHT = 240.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	int y_index = int(UV.y * SCREEN_HEIGHT);
	if(y_index % 2 == 0){
		COLOR.a = 0.05;
	}
	else {
		COLOR.a = 0.0;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
