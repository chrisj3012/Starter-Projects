ArrayList<Planet> planets;

void setup(){
  planets = new ArrayList();
 
  

  frameRate(60);
  size(800, 800);
  JSONArray j = loadJSONArray("fauna.json"); 
  for(int i = 0; i < j.size(); i++){
      String name = j.getJSONObject(i).getString("name");
      float size = (j.getJSONObject(i).getFloat("weight") * 5);
      float dist = map(j.getJSONObject(i).getFloat("lifespan"),0,50, 0, width/2);
      int days = (j.getJSONObject(i).getInt("top_speed") * 75) -2;
      planets.add(new Planet(name, dist,size, days));
     
      
      //ellipse(map(j.getJSONObject(i).getFloat("distanceFromSun"),0,6000, 0, width/2), height/2, diam, diam);
  }
}

void draw(){ 
 background(0);
 fill(255, 255, 0);
 
 ellipse(width/2, height/2, 50,50);
 fill(255);
 for(int i = 0; i < planets.size(); i ++){
   planets.get(i).update();
 }
}
