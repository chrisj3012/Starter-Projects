class Planet{
  String name;
  float dist;
  float size;
  float orbit;
  float rot;
  Planet(String name, float dist, float size, float orbit){
    this.name = name;
    this.dist = dist;
    this.orbit = orbit;
    this.size = size;
    rot = random(0, 360);
  }
  
  void update(){
    pushMatrix();
    translate(width/2, height/2);
    rotate(rot);
    ellipse(0, dist, size, size);
    popMatrix();
    rot = rot + PI*2/(orbit / 10);
  }
}
