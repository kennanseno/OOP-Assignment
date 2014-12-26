ArrayList<Player> players = new ArrayList<Player>();
ArrayList<GameObject> objects = new ArrayList<GameObject>();
boolean[] keys = new boolean[526];

void setup(){
  size(500, 500);
  setUpPlayerControllers();
  objects.add(new Spatula(200,200));
  
}

void draw(){
  background(0);
  
   for(int i = 0; i < 15; i++){
    stroke(0,255,0);
    line(0,i*50,width,i*50);
    line(i*50,0,i*50,height);
  }  
  
  for(Player player:players){
    if(player.life > 0){
      player.update();
      player.display();
    }
  }
  
  objects.get(0).display(); 
  objects.get(0).update(); 
}

void keyPressed(){
  keys[keyCode] = true;
}

void keyReleased(){
  keys[keyCode] = false;
}

boolean checkKey(char theKey){
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName){
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value)) {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value)) {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value)) {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value)) {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers(){
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
    players.add(p);         
  }
}
