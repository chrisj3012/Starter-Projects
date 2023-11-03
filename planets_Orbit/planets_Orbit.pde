ArrayList<Planet> planets;

void setup(){
  planets = new ArrayList();
 
  

  frameRate(60);
  size(1000, 1000);
  JSONArray j = loadJSONArray("planet.json"); 
  for(int i = 0; i < j.size(); i++){
      String name = j.getJSONObject(i).getString("name");
      float size = (j.getJSONObject(i).getFloat("diameter") / 5000)+2;
      float dist = map(j.getJSONObject(i).getFloat("distanceFromSun"),0,6000, 100, width/2);
      int days = j.getJSONObject(i).getInt("orbitDays");
      planets.add(new Planet(name, dist,size, days));
     
      
      //ellipse(map(j.getJSONObject(i).getFloat("distanceFromSun"),0,6000, 0, width/2), height/2, diam, diam);
  }
}

void draw(){ 
 background(0);
 fill(255, 255, 0);
 
 ellipse(width/2, height/2, 70,70);
 fill(255);
 for(int i = 0; i < planets.size(); i ++){
   planets.get(i).update();
 }
}
