import processing.net.*;
Server myServer;
String incoming;
String outgoing;
String valid ="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890 !@#$%^&*()?.<>";
void setup(){
  
 size(300,300);
 textAlign(CENTER,CENTER);
 outgoing= "";
 incoming ="";
 
 myServer = new Server(this,1234);
}

void draw(){
  
  
  
  
  background(0);
  fill(255);
  text(incoming,width/2,height/2+100);
   text(outgoing,width/2,height/2+100);
  
  Client myClient = myServer.available();
  if(myClient !=null){
   incoming = myClient.readString(); 
  }
  
  
  
  
  
  
  
}

void keyPressed(){
 if(key==ENTER){
   
   myServer.write(outgoing);
   outgoing="";
 } else if (key == BACKSPACE && outgoing.length() > 0){
   outgoing = outgoing.substring(0,outgoing.length()-1);
 }else if (valid.contains(""+key)){
     outgoing=outgoing+key;
}
}
